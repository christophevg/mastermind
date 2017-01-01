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

struct Code : CustomStringConvertible {
  let parts : [Color]

  var description : String {
    var d =  "Code("
    for p in parts {
      d += "\(p.rawValue), "
    }
    let c = d.characters.count
    return String(d.characters.prefix(c-2)) + ")"
  }

  static func generate() -> Code {
    return Code(parts:[
      Color.randomColor(),
      Color.randomColor(),
      Color.randomColor(),
      Color.randomColor()
    ])
  }
}
