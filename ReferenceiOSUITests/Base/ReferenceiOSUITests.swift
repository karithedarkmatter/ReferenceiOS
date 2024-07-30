import Foundation
import XCTest

class ReferanceUITestBase: XCTestCase {
    
    var app = XCUIApplication()
    var viewController: UIViewController!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        
        viewController = UIViewController()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
}
