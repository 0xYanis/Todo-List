//
//  ListRowView.swift
//  TodoList
//
//  Created by Yan Rybkin on 19.12.2022.
//

import SwiftUI

struct ListRowView: View {
	
	let item: ItemModel
	
	var body: some View {
		ZStack {
			VStack {
				HStack(spacing: 15) {
					Circle()
						.foregroundColor(Color(.opaqueSeparator))
						.frame(width: 30, height: 30)
						.overlay {
							Circle().stroke(item.isCompleted ? .green : .red,
											lineWidth: 7)
						}
					
					Text(item.title)
						.foregroundColor(.white)
					Spacer()
				}
				.padding()
				.background(Color(.opaqueSeparator))
				.cornerRadius(15)
				//.shadow(color: .gray, radius: 10, x:0, y:4)
			}
		}
	}
}

struct ListRowView_Previews: PreviewProvider {
	
	static var item1 = ItemModel(title: "First item!", isCompleted: false)
	static var item2 = ItemModel(title: "Second item!", isCompleted: true)
	
    static var previews: some View {
		Group {
			ListRowView(item: item1)
			ListRowView(item: item2)
		}
		.previewLayout(.sizeThatFits)
    }
}
