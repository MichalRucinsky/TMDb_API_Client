import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(TMDb_API_ClientTests.allTests),
    ]
}
#endif
