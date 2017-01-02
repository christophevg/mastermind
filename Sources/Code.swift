import Foundation  // for arc4random_uniform

enum Color : String {
  case white  = "White"
  case yellow = "Yellow"
  case orange = "Orange"
  case red    = "Red"
  case pink   = "Pink"
  case blue   = "Blue"
  case green  = "Green"
  case grey   = "Grey"
  
  static var cases : [Color] = [
    .white, .yellow, .orange, .red, .pink, .blue, .green, .grey
  ]
  
  static func randomColor() -> Color {
    let random = Int(arc4random_uniform(8))
    return Color.cases[random]
  }
}

enum CodeError : Error {
  case invalidPartsCount
  case invalidComparisonParameters
}

struct Code : CustomStringConvertible, Equatable, Collection {
  private let parts : [Color]

  var description : String {
    var d =  "Code("
    for p in parts {
      d += "\(p.rawValue), "
    }
    let c = d.characters.count
    return String(d.characters.prefix(c-2)) + ")"
  }

  public init(_ parts : [Color]) throws {
    if parts.count != 4 { throw CodeError.invalidPartsCount }
    self.parts = parts
  }

  static func generate() -> Code {
    // we _know_ that this will _not_ throw ;-)
    return try! Code([
      Color.randomColor(),
      Color.randomColor(),
      Color.randomColor(),
      Color.randomColor()
    ])
  }

  static func ==(lhs:Code, rhs:Code) -> Bool {
    return lhs.parts == rhs.parts
  }

  subscript(index: Int) -> Color {
    return self.parts[index]
  }
  
  var startIndex: Int { return 0 }
  var endIndex: Int   { return self.parts.count }
  
  func index(after i: Int) -> Int {
    precondition(i < endIndex, "Can't advance beyond endIndex")
    return i + 1
  }
}

// via: http://stackoverflow.com/questions/30545518
extension Sequence where Self.Iterator.Element: Hashable {
  private typealias Element = Self.Iterator.Element

  func freq() -> [Element: Int] {
    return reduce([:]) { (accu: [Element: Int], element) in
      var accu = accu
      accu[element] = accu[element]?.advanced(by: 1) ?? 1
      return accu
    }
  }
}

struct CodeComparison {
  let correct   : UInt8
  let misplaced : UInt8

  public init(correct: UInt8, misplaced:UInt8) throws {
    // check that misplaced + correct <= 4
    if correct + misplaced > 4 {
      throw CodeError.invalidComparisonParameters
    }
    self.correct   = correct
    self.misplaced = misplaced
  }
  
  // inspired by http://codereview.stackexchange.com/questions/20825
  static func compare(_ lhs:Code, _ rhs:Code) -> CodeComparison {
    let correct : UInt8 = 
       zip(lhs, rhs)
      .map { $0.0 == $0.1 }
      .reduce(0) { $0 + ($1 ? 1 : 0) }

    let lhsFreqs = lhs.freq()
    let rhsFreqs = rhs.freq()
    
    let pins : UInt8 = lhsFreqs.reduce(0) {
      (_ acc:UInt8, freq:(color:Color, count:Int)) in
      return acc + UInt8(min(freq.count, (rhsFreqs[freq.color] ?? 0)))
    }
    
    return try! CodeComparison(correct: correct, misplaced: pins - correct)
  }
}
