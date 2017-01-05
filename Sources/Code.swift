import Foundation  // for arc4random_uniform

enum Color : String {
  case white  = "\u{001B}[0;97mWhite\u{001B}[0;39m"
  case yellow = "\u{001B}[0;33mYellow\u{001B}[0;39m"
  case orange = "\u{001B}[0;91mOrange\u{001B}[0;39m"
  case red    = "\u{001B}[0;31mRed\u{001B}[0;39m"
  case pink   = "\u{001B}[0;35mPink\u{001B}[0;39m"
  case blue   = "\u{001B}[0;34mBlue\u{001B}[0;39m"
  case green  = "\u{001B}[0;32mGreen\u{001B}[0;39m"
  case grey   = "\u{001B}[0;90mGrey\u{001B}[0;39m"
  
  static var cases : [Color] = [
    .white, .yellow, .orange, .red, .pink, .blue, .green, .grey
  ]
  
  static func randomColor() -> Color {
    let random = Int(arc4random_uniform(8))
    return Color.cases[random]
  }

  init?(_ index: Int) {
    if !(0...8).contains(index) {
      return nil
    }
    self = Color.cases[index]
  }

  init?(_ rawValue: String) {
    self.init(rawValue:rawValue)
  }
}

enum CodeError : Error {
  case invalidPartsCount
  case invalidComparisonParameters
  case invalidCodeIndex
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

  public init(atIndex index:UInt16) throws {
    if !(0..<0o10000).contains(index) {
      throw CodeError.invalidCodeIndex
    }

    let octal  = Int(String(index, radix: 8))
    let colors = String(format: "%04d", octal!).characters.map {
      return Color(Int(String($0))!)!
    }

    try! self.init(colors)
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

struct CodeComparison : Equatable, Hashable {
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

  static func ==(lhs:CodeComparison, rhs:CodeComparison) -> Bool {
    return lhs.correct == rhs.correct && lhs.misplaced == rhs.misplaced
  }

  var hashValue: Int {
    return Int(self.correct) * 10 + Int(self.misplaced)
  }
}
