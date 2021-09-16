//
//  TechChallengeApp.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

@main
struct TechChallengeApp: App {
    @State var selectedTab: Tab = .transactions

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                NavigationView {
                    TransactionListView()
                }
                .tabItem {
                    Label("Transactions", systemImage: "list.bullet")
                }.tag(Tab.transactions)
                
                NavigationView {
                    InsightsView()
                }
                .tabItem {
                    Label("Insights", systemImage: "chart.pie.fill")
                }.tag(Tab.insight)
            }
        }
    }
}

extension TechChallengeApp {
    enum Tab: Hashable {
        case transactions
        case insight
    }
}
