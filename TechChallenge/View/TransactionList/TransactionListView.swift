//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    private var categoryData = CategoryData()
    @ObservedObject var modelData: ModelData = ModelData.shared
    @State var selectedCategory: TransactionModel.Category = .all
        
    var body: some View {
        let transactions = modelData.sampleTransactions.filterTransactions(by: self.selectedCategory)

        VStack {
            // Top Category List View
            CategoryListView(selectedCategory: self.$selectedCategory)

            // Transaction List View
            TransactionList(transactions: transactions)

            // Bottom View
            FooterView(total: transactions.pinnedTransactions().sumOfTransactions(), category: self.selectedCategory).padding(.all, 10)
        }.padding(.bottom, 10)
    }    
}

struct TransactionList: View {
    var transactions: [TransactionModel]
    
    var body: some View {
        List {
            ForEach(transactions) { transaction in
                TransactionView(transaction: transaction)
            }
        }
        .animation(.easeIn)
        .listStyle(PlainListStyle())
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Transactions")
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
#endif
