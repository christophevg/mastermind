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
var i = 1

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
var guess : Code? = remaining[g]
var result = isCode(guess!)

while result.correct != 4 {

  // only keep the remaining possible codes that have the same result
  print(">>> only keeping with ", result, "for", guess!)
  remaining = remaining.filter { result == CodeComparison.compare($0, guess!) }
  print("   ", remaining.count, "remaining")
  
  // apply MiniMax
  // for each remaining possible code
  //   take least eliminating CodeComparison (least eliminations == score)
  // track the highest score
  print(">>> selecting best next guess")
  (guess, _, _) = remaining.reduce((nil, -1, 0)) {
    (best: (code:Code?, score:Int, index:Int), possibleGuess) in
    let results = remaining.map { CodeComparison.compare($0, possibleGuess) }
    let freqs   = results.freq()
    let score   = remaining.count - freqs.values.max()!
    if score > best.score {
      print("   ", best.index, possibleGuess, "eliminates at least", score)
      return (possibleGuess, score, best.index + 1)
    }
    return (best.code, best.score, best.index + 1)
  }

  // compute result for newly "guessed" code
  result = isCode(guess!)

}

print("+++ Cracked", guess!, "with", result)
