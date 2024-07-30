@testable import ReferenceiOS
import XCTest

extension ReferanceUITestBase {
    func givenAppIsReady() {
        XCTContext.runActivity(named: "Given App is ready") { _ in
            XCTAssertTrue(ReferanceiOSScreen.generateButton.element.exists)
        }
        XCTAssertTrue(ReferanceiOSScreen.helloLable.element.exists, "Label with accessibility identifier 'HelloLable' should exist.")
    }
    
    func whenIClick() {
        XCTContext.runActivity(named: "When user clicks on the Button") { _ in
            ReferanceiOSScreen.generateButton.element.tap()
        }
    }
    func thenCurrencyChanged() {
        XCTAssertTrue(ReferanceiOSScreen.helloLable.element.exists, "Label should not be empty after button tap.")
        
        XCTContext.runActivity(named: "Generate button should exist."){ _ in
            ReferanceiOSScreen.generateButton.element.tap()
        }
    }
    
    
    
    func givenViewControllerIsLoaded() {
        XCTContext.runActivity(named: "Given ViewController is loaded") { _ in
            viewController = ViewController()
            _ = viewController.view 
        }
    }
    
    func whenUserTakesSnapshot() {
        XCTContext.runActivity(named: "When user takes a snapshot") { _ in
            viewController.userTookScreenshot()
        }
    }
    
    func thenSnapshotAlertIsPresented() {
         XCTContext.runActivity(named: "Then a snapshot alert should be presented") { _ in
             guard let presentedVC = viewController.presentedViewController as? UIAlertController else {
                 XCTFail("Expected an UIAlertController to be presented")
                 return
             }
             
             XCTAssertEqual(presentedVC.title, "Screenshot", "Expected alert title to be 'Screenshot'")
             XCTAssertEqual(presentedVC.message, "User took screenshot", "Expected alert message to be 'User took screenshot'")
             XCTAssertEqual(presentedVC.actions.count, 1, "Expected one action in the alert")
             XCTAssertEqual(presentedVC.actions.first?.title, "Ok", "Expected action title to be 'Ok'")
             XCTAssertEqual(presentedVC.actions.first?.style, .cancel, "Expected action style to be 'cancel'")
         }
     }
}
