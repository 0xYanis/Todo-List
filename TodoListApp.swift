//
//  TodoListApp.swift
//  TodoList
//
//  Created by Yan Rybkin on 19.12.2022.
//

import SwiftUI

/*
 
 MVVM architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for View
 
 */

@main
struct TodoListApp: App {
	
	@StateObject var listViewModel: ListViewModel = ListViewModel()
	
    var body: some Scene {
        WindowGroup {
			NavigationView {
				ListView()
			}
			.navigationViewStyle(StackNavigationViewStyle())
			.environmentObject(listViewModel)
        }
    }
}
