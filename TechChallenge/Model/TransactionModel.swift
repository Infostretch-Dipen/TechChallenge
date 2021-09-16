//
//  TransactionModel.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import Foundation

// MARK: - TransactionModel

class TransactionModel: ObservableObject {
    enum Category: String, CaseIterable {
        case all
        case food
        case health
        case entertainment
        case shopping
        case travel
    }
    
    enum Provider: String {
        case amazon
        case americanAirlines
        case burgerKing
        case cvs
        case exxonmobil
        case jCrew
        case starbucks
        case timeWarner
        case traderJoes
        case uber
        case wawa
        case wendys
    }
    
    let id: Int
    let name: String
    let category: Category
    let amount: Double
    let date: Date
    let accountName: String
    let provider: Provider?
    @Published var isPinned: Bool
    
    init(id: Int,
        name: String,
        category: Category,
        amount: Double,
        date: Date,
        accountName: String,
        provider: Provider,
        isPinned: Bool = true) {
        self.id = id
        self.name = name
        self.category = category
        self.amount = amount
        self.date = date
        self.accountName = accountName
        self.provider = provider
        self.isPinned = isPinned
    }
    
    func togglePinnedState() {
        self.isPinned.toggle()

        guard let index = ModelData.shared.sampleTransactions.firstIndex(where: { $0.id == self.id }) else {
            return
        }
        ModelData.shared.sampleTransactions.remove(at: index)
        ModelData.shared.sampleTransactions.insert(self, at: index)
    }
}

extension TransactionModel: Identifiable { }

// MARK: - Category

extension TransactionModel.Category: Identifiable {
    var id: String {
        rawValue
    }
}

extension TransactionModel.Category {
    static subscript(index: Int) -> Self? {
        guard
            index >= 0 &&
            index < TransactionModel.Category.allCases.count
        else {
            return nil
        }
        
        return TransactionModel.Category.allCases[index]
    }
}
