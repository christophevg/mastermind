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

  static var allTests : [(String, (CodeTests) -> () throws -> Void)] {
    return [
      ( "testDescription",                 testDescription                 ),
      ( "testTooFewParts",                 testTooFewParts                 ),
      ( "testTooManyParts",                testTooManyParts                ),
      ( "testEqualCodes",                  testEqualCodes                  ),
      ( "testNotEqualCodes",               testNotEqualCodes               ),
      ( "testValidComparisonBoundaries",   testValidComparisonBoundaries   ),
      ( "testInvalidComparisonBoundaries", testInvalidComparisonBoundaries ),
      ( "testCodeSubscripting",            testCodeSubscripting            ),
    ]
  }
}
