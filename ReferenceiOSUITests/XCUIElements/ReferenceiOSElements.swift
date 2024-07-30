import Foundation
import XCTest

enum ReferanceiOSScreen: String {
    case helloLable = "HelloLable"
    case generateButton = "Button"
    
    var element: XCUIElement {
        
        switch self {
        case .helloLable:
            return XCUIApplication().descendants(matching: .any).matching(identifier: self.rawValue).element
        case .generateButton:
            return XCUIApplication().buttons[self.rawValue]
        }
    }
}
