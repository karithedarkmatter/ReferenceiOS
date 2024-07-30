import XCTest
@testable import ReferenceiOS

class CurrencyHelperTests: XCTestCase {
    
    func testFormatRounding() {
        let amountString: NSNumber = 129.999
        let amount = CurrencyHelper.format(amount: amountString)
        let expectedAmount = "€ 130,00"
        XCTAssertEqual(amount, expectedAmount, "The rounded amount should be \(expectedAmount)")
    }
    
    func testFormatRegular() {
        let amountString: NSNumber = 122
        let amount = CurrencyHelper.format(amount: amountString)
        let expectedAmount = "€ 122,00"
        XCTAssertEqual(amount, expectedAmount, "The formatted amount should be \(expectedAmount)")
    }
    
    func testFormatDecimals() {
        let amountString: NSNumber = 122.50
        let amount = CurrencyHelper.format(amount: amountString)
        let expectedAmount = "€ 122,50"
        XCTAssertEqual(amount, expectedAmount, "The formatted amount should be \(expectedAmount)")
    }
    
    func testAttributifyAmount() {
        let amountString = "€ 1.234,56"
        let attributedAmount = CurrencyHelper.attributify(amount: amountString)
        
        let range = NSRange(location: amountString.count - CurrencyHelper.decimalCount, length: CurrencyHelper.decimalCount)
        let attributes = attributedAmount.attributes(at: range.location, effectiveRange: nil)
        
        let expectedFont = UIFont(name: "Helvetica", size: CurrencyHelper.superscriptSize)
        XCTAssertEqual(attributes[.font] as? UIFont, expectedFont, "The font for the decimals should be superscript size")
        
        let expectedBaselineOffset = (CurrencyHelper.regularSize - CurrencyHelper.superscriptSize) - CurrencyHelper.diff
        XCTAssertEqual(attributes[.baselineOffset] as? CGFloat, expectedBaselineOffset, "The baseline offset for the decimals should be \(expectedBaselineOffset)")
    }
}
