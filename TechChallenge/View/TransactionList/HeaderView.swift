//
//  HeaderView.swift
//  TechChallenge
//
//  Created by Dipen Panchasara on 16/09/21.
//

import SwiftUI

struct HeaderView: View {
    private var categoryData = CategoryData()
    @State var selectedCategory: TransactionModel.Category = .all
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(self.categoryData.categories, id: \.id) { categoryInfo in
                    Button(action: {
//                        print("Selected category \(categoryInfo.name)")
                        self.selectedCategory = categoryInfo.type
                    },
                    label: {
                        Text(categoryInfo.name)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .foregroundColor(.white)
                            .background(categoryInfo.backgroundColor)
                            .cornerRadius(20)
                            .font(Font.headline.weight(.bold))
                    }).frame(height: 40)
                }
            }
        }.frame(height: 40,
                alignment: .leading)
        .padding(.all, 10)
        .background(Color.accentColor.opacity(0.8))
    }
}


#if DEBUG
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
#endif
