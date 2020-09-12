import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(algorithms_data_structuresTests.allTests),
    ]
}
#endif
