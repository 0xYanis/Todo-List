//
//  TodoListApp.swift
//  TodoList
//
//  Created by Yan Rybkin on 19.12.2022.
//

import SwiftUI

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
