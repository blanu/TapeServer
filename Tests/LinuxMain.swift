import XCTest

import TapeServerTests

var tests = [XCTestCaseEntry]()
tests += TapeServerTests.allTests()
XCTMain(tests)
