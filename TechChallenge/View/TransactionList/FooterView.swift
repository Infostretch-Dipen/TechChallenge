//
//  FooterView.swift
//  TechChallenge
//
//  Created by Dipen Panchasara on 16/09/21.
//

import SwiftUI

struct FooterView: View {    
    var total: Double
    var category: TransactionModel.Category
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(category.id)
                    .font(Font.headline.bold())
                    .foregroundColor(category.color)
            }
            
            HStack {
                Text("Total spent:")
                    .font(Font.headline.bold())
                    .secondary()
                Spacer()
                Text("$\(total.formatted(hasDecimals: true))")
                    .font(Font.headline)
                    .secondary()
            }
        }
        .padding(10)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.accentColor.opacity(0.8), lineWidth: 2)
        )
    }
}

#if DEBUG
struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(total: 0, category: .all)
            .padding(.all, 10)
    }
}
#endif
