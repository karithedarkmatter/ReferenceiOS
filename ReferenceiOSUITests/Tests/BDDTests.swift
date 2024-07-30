import Foundation
import XCTest

@testable import ReferenceiOS

class BDDTests: ReferanceUITestBase {
    
    
    func testCurrencesScreen() {
        givenAppIsReady()
        whenIClick()
        thenCurrencyChanged()
    }
    
     func testUserTookSnapshot() {
        givenViewControllerIsLoaded()
        whenUserTakesSnapshot()
        thenSnapshotAlertIsPresented()
    }
     
}
