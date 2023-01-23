//
//  ListView.swift
//  TodoList
//
//  Created by Yan Rybkin on 19.12.2022.
//

import SwiftUI

struct ListView: View {
	
	@EnvironmentObject var listViewModel: ListViewModel
	
	var body: some View {
		ZStack {
			LinearGradient(colors: [.black],
						   startPoint: .top,
						   endPoint: .bottom)
			.edgesIgnoringSafeArea(.all)
			if listViewModel.items.isEmpty {
				NoItemsView()
					.transition(AnyTransition.opacity.animation(.easeIn))
			} else {
				VStack {
					List {
						ForEach(listViewModel.items) { item in
							ListRowView(item: item)
								.onTapGesture {
									withAnimation(.linear(duration: 0.2)
									)
									{
										listViewModel.updateItem(item: item)
									}
								}
						}
						.onDelete(perform: listViewModel.deleteItem)
						.onMove(perform: listViewModel.moveItem)
					}
					.listStyle(InsetListStyle())
				}
				.navigationTitle("What to do?")
				.navigationBarTitleDisplayMode(.inline)
				.navigationBarItems(
					leading: EditButton(),
					trailing: NavigationLink("New", destination: AddView())
				)
			}
		}
	}
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			ListView()
		}
		.environmentObject(ListViewModel())
		.navigationBarTitleDisplayMode(.inline)
    }
}
