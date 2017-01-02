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
}

struct Code : CustomStringConvertible, Equatable {
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
    return parts[index]
  }
}
