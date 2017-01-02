import XCTest
@testable import MasterMind

class CodeTests: XCTestCase {

  func testDescription() {
    let code = Code(parts:[.red, .green, .yellow, .blue])
    XCTAssertEqual(String(describing:code), "Code(Red, Green, Yellow, Blue)")
  }

  static var allTests : [(String, (CodeTests) -> () throws -> Void)] {
    return [
      ( "testDescription", testDescription ),
    ]
  }
}
