//
//  Array.swift
//  TechChallenge
//
//  Created by Dipen Panchasara on 16/09/21.
//

import Foundation

extension Array where Element: TransactionModel {
    func filterTransactions(by category: TransactionModel.Category) ->  [TransactionModel] {
        if category == .all {
            return self
        }
        
        // Filter based on category.
        let result = self.filter({ $0.category == category })
        return result
    }
    
    func pinnedTransactions() -> [TransactionModel] {
        let result = self.filter({ $0.isPinned })
        return result
    }
        
    func sumOfTransactions() -> Double {
        let sum = self.map({ $0.amount }).reduce(0, +)
        return sum
    }
}
