//
//  TechChallengeTests.swift
//  TechChallengeTests
//
//  Created by Adrian Tineo Cabello on 30/7/21.
//

import XCTest
@testable import TechChallenge

class TechChallengeTests: XCTestCase {
    var modelData: ModelData!
    var transactions: [TransactionModel]!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.modelData = ModelData.shared
        self.transactions = [
            TransactionModel(
                id: 1,
                name: "Movie Night",
                category: .entertainment,
                amount: 82.99,
                date: Date(string: "2021-03-05")!,
                accountName: "randomAccountName",
                provider: .timeWarner
            ),
            TransactionModel(
                id: 2,
                name: "Jeans",
                category: .shopping,
                amount: 54.60,
                date: Date(string: "2021-04-25")!,
                accountName: "randomAccountName",
                provider: .jCrew
            ),
            TransactionModel(
                id: 3,
                name: "Salad Mix",
                category: .food,
                amount: 25.32,
                date: Date(string: "2021-04-15")!,
                accountName: "randomAccountName",
                provider: .wendys
            ),
            TransactionModel(
                id: 4,
                name: "Lunch Special",
                category: .food,
                amount: 10.36,
                date: Date(string: "2021-04-12")!,
                accountName: "randomAccountName",
                provider: .burgerKing
            ),
            TransactionModel(
                id: 5,
                name: "Airport ride",
                category: .travel,
                amount: 54.28,
                date: Date(string: "2021-04-02")!,
                accountName: "Test",
                provider: .uber
            ),
            TransactionModel(
                id: 6,
                name: "Monthly Best Seller",
                category: .shopping,
                amount: 6.51,
                date: Date(string: "2021-04-22")!,
                accountName: "TestAccountName",
                provider: .amazon
            ),
            TransactionModel(
                id: 7,
                name: "Triple Spice Souce",
                category: .food,
                amount: 12.76,
                date: Date(string: "2021-04-22")!,
                accountName: "randomAccountName",
                provider: .traderJoes
            ),
            TransactionModel(
                id: 8,
                name: "Meds",
                category: .health,
                amount: 21.53,
                date: Date(string: "2021-04-04")!,
                accountName: "randomAccountName",
                provider: .cvs
            ),
            TransactionModel(
                id: 9,
                name: "Potato Snack",
                category: .food,
                amount: 15.95,
                date: Date(string: "2021-04-19")!,
                accountName: "randomAccountName",
                provider: .wawa
            ),
            TransactionModel(
                id: 10,
                name: "Refuel",
                category: .travel,
                amount: 44.22,
                date: Date(string: "2021-04-21")!,
                accountName: "randomAccountName",
                provider: .exxonmobil
            ),
            TransactionModel(
                id: 11,
                name: "Matcha Latte",
                category: .food,
                amount: 9.89,
                date: Date(string: "2021-04-27")!,
                accountName: "Test",
                provider: .starbucks
            ),
            TransactionModel(
                id: 12,
                name: "Riders Cap",
                category: .shopping,
                amount: 16.89,
                date: Date(string: "2021-04-26")!,
                accountName: "randomAccountName",
                provider: .jCrew,
                isPinned: false
            ),
            TransactionModel(
                id: 13,
                name: "Outbound Trip",
                category: .travel,
                amount: 116.78,
                date: Date(string: "2021-04-30")!,
                accountName: "Test",
                provider: .americanAirlines,
                isPinned: false
            )
        ]
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.modelData = nil
        self.transactions = nil
    }

    func testFilterByCategory() throws {
        let filterResultAll = self.transactions.filterTransactions(by: .all)
        XCTAssertEqual(filterResultAll.count, 13)
        
        let filterResultFood = self.transactions.filterTransactions(by: .food)
        XCTAssertEqual(filterResultFood.count, 5)
        
        let filterResultEntertainment = self.transactions.filterTransactions(by: .entertainment)
        XCTAssertEqual(filterResultEntertainment.count, 1)
    }

    func testPinnedTransactions() throws {
        let filterPinnedTransactions = self.transactions.pinnedTransactions()
        XCTAssertEqual(filterPinnedTransactions.count, 11)
    }
    
    func testSumOfTransactions() throws {
        let sum = self.transactions.sumOfTransactions()
        XCTAssertEqual(sum, 472.0799999999999)
        
        let pinnedSum = self.transactions.pinnedTransactions().sumOfTransactions()
        XCTAssertEqual(pinnedSum, 338.40999999999997)
        
        let sumOfTravelTransactions = self.transactions.filterTransactions(by: .travel).sumOfTransactions()
        XCTAssertEqual(sumOfTravelTransactions, 215.28)
    }
    
    func testGraphData() {
        // calculate graph data
        let result = self.modelData.graphData()
        XCTAssertEqual(result[0].offset, 0)
        XCTAssertEqual(result[1].offset, 0.1573462125063549)
        XCTAssertEqual(result[2].offset, 0.20295288934078975)
        XCTAssertEqual(result[3].offset, 0.37874936451448915)
        XCTAssertEqual(result[4].offset, 0.5439755973563803)
        
        XCTAssertEqual(result[0].ratio, 0.1573462125063549)
        XCTAssertEqual(result[1].ratio, 0.04560667683443485)
        XCTAssertEqual(result[2].ratio, 0.1757964751736994)
        XCTAssertEqual(result[3].ratio, 0.16522623284189122)
        XCTAssertEqual(result[4].ratio, 0.4560244026436198)
    }
    
    func testFormattedValue() {
        let value = 100.0234
        XCTAssertEqual(value.formatted(hasDecimals: true), "100.02")
    }
}
