import FBSnapshotTestCase
@testable import Example

class ExampleTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        self.recordMode = false
    }
    
    func testMarkdown() {
      let expect = expectation(description: "hoge")
      let vc = Example1ViewController.make()
      vc.loadViewIfNeeded()
      vc.onMarkdownRendered = {
        expect.fulfill()
      }
      wait(for: [expect], timeout: 10)
      FBSnapshotVerifyView(vc.view)
    }


  static func wait(for seconds: TimeInterval, view: UIView? = nil) {
    let date = Date(timeIntervalSinceNow: seconds)
    RunLoop.current.run(until: date)
    if let view = view {
      view.layoutIfNeeded()
      RunLoop.current.run(until: Date(timeIntervalSinceNow: 1))
    }
  }
    
}
