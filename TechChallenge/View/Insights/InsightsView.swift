//
//  InsightsView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 29/7/21.
//

import SwiftUI

struct InsightsView: View {
    @ObservedObject var modelData: ModelData = ModelData.shared
    
    var body: some View {
        List {
            RingView(transactions: modelData.sampleTransactions.pinnedTransactions())
                .scaledToFit()
            
            let transactions = modelData.sampleTransactions
            ForEach(TransactionModel.Category.allCases[1...5]) { category in
                let result = transactions.filterTransactions(by: category)
                let sumOfTransaction = result.pinnedTransactions().sumOfTransactions()
                let total = sumOfTransaction.formatted(hasDecimals: true)

                HStack {
                    Text(category.rawValue)
                        .font(.headline)
                        .foregroundColor(category.color)
                    Spacer()
                    Text("$\(total)")
                        .bold()
                        .secondary()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Insights")
    }
}

#if DEBUG
struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView()
            .previewLayout(.sizeThatFits)
    }
}
#endif
