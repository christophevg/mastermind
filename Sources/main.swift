// attempt to implement the Mastermind solver algorithm described by Donald
// Knuth as described in
// https://en.wikipedia.org/wiki/Mastermind_(board_game)#Five-guess_algorithm
// changes
// - only using remaining set, not all non-tried

import Foundation

let code = Code.generate()
print("+++ The code to crack is", code)

// there are 4096 (8^4) possible codes
var remaining : [Code] = {
  var remaining : [Code] = []
  for index : UInt16 in 0...4095 {
    let code = try! Code(atIndex: index)
    remaining.append(code)
  }
  return remaining
}()

// track guesses
var i = 0

func isCode(_ guess:Code) -> CodeComparison {
  print(">>> guess \(i)", guess)
  i += 1

  // compare the guess to the code
  let result = CodeComparison.compare(code, guess)
  print("    result", result)

  return result
}

// start with a random guess
let g : Int = Int(arc4random_uniform(UInt32(remaining.count)))
var guess = remaining[g]

var result = isCode(guess)
while result.correct != 4 {
  print(">>> only keeping with ", result, "for", guess)
  // only keep the remaining possible codes that have the same result
  remaining = remaining.filter { 
    return result == CodeComparison.compare($0, guess)
  }
  print("   ", remaining.count, "remaining")
  
  // apply MiniMax
  // for each remaining possible code
  //   take least eliminating CodeComparison (least eliminations == score)
  // track the highest score
  print(">>> selecting best next guess")
  let best = remaining.reduce((nil, -1, 0)) {
    (accu: (Code?, Int, Int), guess) in
    var accu = accu
    accu.2 += 1
    let results = remaining.map { CodeComparison.compare($0, guess) }
    let freqs   = results.freq()
    let score   = remaining.count - freqs.values.max()!
    if score > accu.1 {
      print("   ", accu.2, guess, "eliminates at least", score)
      return (guess, score, accu.2)
    }
    return accu
  }

  guess = best.0!
  result = isCode(guess)
}

print("+++ Cracked code", guess)
