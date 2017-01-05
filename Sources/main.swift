// attempt to implement the Mastermind solver algorithm described by Donald
// Knuth as described in
// https://en.wikipedia.org/wiki/Mastermind_(board_game)#Five-guess_algorithm
// changes
// - only using remaining set, not all non-tried

import Foundation

#if os(Linux)
  import Glibc
#else
  import Darwin.C
#endif

let code = Code.generate()
print("+++ code to crack:", code)

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
  print(">>> guess \(i):", guess, terminator:"")
  i += 1

  // compare the guess to the code
  let result = CodeComparison.compare(code, guess)
  if result.correct + result.misplaced > 0 { print(" :", result) }

  return result
}

// start with a random guess
let g : Int = Int(arc4random_uniform(UInt32(remaining.count)))
var guess : Code? = remaining[g]
var result = isCode(guess!)

while result.correct != 4 {

  // only keep the remaining possible codes that have the same result
  print("    only keeping with", result, "for", guess!, terminator: "")
  remaining = remaining.filter { result == CodeComparison.compare($0, guess!) }
  print(" :", remaining.count, "remaining")
  
  // apply MiniMax
  // for each remaining possible code
  //   take least eliminating CodeComparison (least eliminations == score)
  // track the highest score
  print("    selecting best next guess")
  (guess, _) = remaining.enumerated().reduce((nil, -1)) {
    (best: (code:Code?, score:Int), guess: (index:Int, code:Code)) in
    print(String(format: "    %d/%d", guess.index, remaining.count), terminator:"")
    fflush(stdout)
    let results = remaining.map { CodeComparison.compare($0, guess.code) }
    let freqs   = results.freq()
    let score   = remaining.count - freqs.values.max()!
    print("\r", terminator: "")
    fflush(stdout)
    if score > best.score {
      print("   ", guess.code, "eliminates at least", score)
      return (guess.code, score)
    }
    return (best.code, best.score)
  }

  // compute result for newly "guessed" code
  result = isCode(guess!)

}

print("+++ Cracked")
