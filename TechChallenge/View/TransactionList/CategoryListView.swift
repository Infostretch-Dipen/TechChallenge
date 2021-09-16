//
//  CategoryListView.swift
//  TechChallenge
//
//  Created by Dipen Panchasara on 14/09/21.
//

import SwiftUI

struct CategoryItem {
    let id: Int
    let name: String
    let type: TransactionModel.Category
    let backgroundColor: Color
}

struct CategoryListView: View {
    var categoryData = CategoryData()
    @Binding var selectedCategory: TransactionModel.Category
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(self.categoryData.categories, id: \.id) { categoryInfo in
                    Button(action: {
                        print("Selected category \(categoryInfo.name)")
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

struct CategoryData {
    var categories: [CategoryItem] = []
    
    init() {
        var index = 0
        for categoryType in TransactionModel.Category.allCases {
            let category = CategoryItem(id: index,
                                        name: categoryType.id,
                                        type: categoryType,
                                        backgroundColor: categoryType.color)
            self.categories.append(category)
            index+=1
        }
    }    
}
