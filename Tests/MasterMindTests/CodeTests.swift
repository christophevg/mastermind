import XCTest
@testable import MasterMind

class CodeTests: XCTestCase {

  func testDescription() {
    let code = try! Code([.red, .green, .yellow, .blue])
    XCTAssertEqual(String(describing:code), "Code(Red, Green, Yellow, Blue)")
    let code2 = try! Code([.pink, .orange, .white, .grey])
    XCTAssertEqual(String(describing:code2), "Code(Pink, Orange, White, Grey)")
  }

  private func createCodeWithInvalidPartsCount(_ parts:[Color]) {
    do {
      let _ = try Code(parts)
      XCTFail("Should have thrown.")
    } catch let error as CodeError {
      XCTAssertEqual(error, .invalidPartsCount)
    } catch {
      XCTFail("Invalid Error.")
    }
  }

  func testTooFewParts() {
    self.createCodeWithInvalidPartsCount([.red])
  }

  func testTooManyParts() {
    self.createCodeWithInvalidPartsCount([.red, .green, .blue, .yellow, .grey])
  }

  func testEqualCodes() {
    let code1 = try! Code([.red, .green, .blue, .yellow])
    let code2 = try! Code([.red, .green, .blue, .yellow])
    XCTAssertEqual(code1, code2)
  }

  func testNotEqualCodes() {
    let code1 = try! Code([.red, .green, .blue, .yellow])
    let code2 = try! Code([.blue, .green, .blue, .yellow])
    XCTAssertNotEqual(code1, code2)
  }

  func testValidComparisonBoundaries() {
    // lower boundary
    let _ = try! CodeComparison(correct: 0, misplaced: 0)
    // some in betweens
    let _ = try! CodeComparison(correct: 1, misplaced: 3)
    let _ = try! CodeComparison(correct: 3, misplaced: 1)
    // extremes
    let _ = try! CodeComparison(correct: 4, misplaced: 0)
    let _ = try! CodeComparison(correct: 0, misplaced: 4)
  }

  private func createCodeComparisonWithInvalidParameters(
    correct: UInt8, misplaced: UInt8
  ) {
    do {
      let _ = try CodeComparison(correct: correct, misplaced: misplaced)
      XCTFail("Should have thrown.")
    } catch let error as CodeError {
      XCTAssertEqual(error, .invalidComparisonParameters)
    } catch {
      XCTFail("Invalid Error.")
    }
  }

  func testInvalidComparisonBoundaries() {
    // too large
    self.createCodeComparisonWithInvalidParameters(correct: 5, misplaced: 0)
    self.createCodeComparisonWithInvalidParameters(correct: 0, misplaced: 5)
    // combination too large
    self.createCodeComparisonWithInvalidParameters(correct: 3, misplaced: 3)
  }

  func testCodeSubscripting() {
    let code = try! Code([.red, .green, .blue, .yellow])
    XCTAssertEqual(code[0], .red   )
    XCTAssertEqual(code[1], .green )
    XCTAssertEqual(code[2], .blue  )
    XCTAssertEqual(code[3], .yellow)
  }

  private func compareCodes(_ lhp:[Color], _ rhp:[Color],
                            expectedCorrect correct:UInt8,
                            expectedMisplaced misplaced:UInt8)
  {
    let code1 = try! Code(lhp)
    let code2 = try! Code(rhp)
    let result = CodeComparison.compare(code1, code2)
    XCTAssertEqual(result.correct,   correct)
    XCTAssertEqual(result.misplaced, misplaced)
  }

  func testCodeComparisonAllMisplaced() {
    self.compareCodes(
      [.red, .green, .blue, .yellow],
      [      .green, .blue, .yellow, .red ],
      expectedCorrect:   0,
      expectedMisplaced: 4
    )
  }

  func testCodeComparisonNothingOkay() {
    self.compareCodes(
      [.red,  .green,  .blue, .yellow],
      [.pink, .orange, .grey, .white],
      expectedCorrect:   0,
      expectedMisplaced: 0
    )
  }

  func testCodeComparisonEverythingOkay() {
    self.compareCodes(
      [.red,  .green,  .blue, .yellow],
      [.red,  .green,  .blue, .yellow],
      expectedCorrect:   4,
      expectedMisplaced: 0
    )
  }

  func testCodeComparisonMixedResults() {
    self.compareCodes(
      [.red,  .green,  .blue,   .yellow],
      [.pink, .green,  .yellow, .blue  ],
      expectedCorrect:   1,
      expectedMisplaced: 2
    )
  }

  func testStringBasedColorInit() {
    XCTAssertEqual(Color("White"),  .white )
    XCTAssertEqual(Color("Yellow"), .yellow)
    XCTAssertEqual(Color("Orange"), .orange)
    XCTAssertEqual(Color("Red"),    .red   )
    XCTAssertEqual(Color("Pink"),   .pink  )
    XCTAssertEqual(Color("Blue"),   .blue  )
    XCTAssertEqual(Color("Green"),  .green )
    XCTAssertEqual(Color("Grey"),   .grey  )
  }

  func testIndexBasedColorInit() {
    XCTAssertEqual(Color(0), .white )
    XCTAssertEqual(Color(1), .yellow)
    XCTAssertEqual(Color(2), .orange)
    XCTAssertEqual(Color(3), .red   )
    XCTAssertEqual(Color(4), .pink  )
    XCTAssertEqual(Color(5), .blue  )
    XCTAssertEqual(Color(6), .green )
    XCTAssertEqual(Color(7), .grey  )
  }

  func testCodeIndexBoundaries() {
    do {
      let _ = try Code(atIndex: 4096)
      XCTFail("Should have thrown.")
    } catch let error as CodeError {
      XCTAssertEqual(error, .invalidCodeIndex)
    } catch {
      XCTFail("Invalid Error.")
    }
  }

  func testCodeByIndex() {
    XCTAssertEqual(
      try! Code(atIndex: 4093),
      try! Code([.grey, .grey, .grey, .blue])
    )
    XCTAssertEqual(
      try! Code(atIndex: 0),
      try! Code([.white, .white, .white, .white])
    )
  }

  func testCodeComparisonEquality() {
    XCTAssertEqual(
      try! CodeComparison(correct: 3, misplaced: 1),
      try! CodeComparison(correct: 3, misplaced: 1)
    )
  }

  func testCodeComparisonHashValue() {
    XCTAssertEqual(
      try! CodeComparison(correct: 3, misplaced: 1).hashValue,
      31
    )
  }
}

#if os(Linux)
extension CodeTests {
	static var allTests : [(String, CodeTests -> () throws -> Void)] {
		return [
      ( "testDescription",                  testDescription                  ),
      ( "testTooFewParts",                  testTooFewParts                  ),
      ( "testTooManyParts",                 testTooManyParts                 ),
      ( "testEqualCodes",                   testEqualCodes                   ),
      ( "testNotEqualCodes",                testNotEqualCodes                ),
      ( "testValidComparisonBoundaries",    testValidComparisonBoundaries    ),
      ( "testInvalidComparisonBoundaries",  testInvalidComparisonBoundaries  ),
      ( "testCodeSubscripting",             testCodeSubscripting             ),
      ( "testCodeComparisonAllMisplaced",   testCodeComparisonAllMisplaced   ),
      ( "testCodeComparisonNothingOkay",    testCodeComparisonNothingOkay    ),
      ( "testCodeComparisonEverythingOkay", testCodeComparisonEverythingOkay ),
      ( "testCodeComparisonMixedResults",   testCodeComparisonMixedResults   ),
      ( "testStringBasedColorInit",         testStringBasedColorInit         ),
      ( "testIndexBasedColorInit",          testIndexBasedColorInit          ),
      ( "testCodeIndexBoundaries",          testCodeIndexBoundaries          ),
      ( "testCodeByIndex",                  testCodeByIndex                  ),
		]
	}
}
#endif
