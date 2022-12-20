//
//  NoItemsView.swift
//  TodoList
//
//  Created by Yan Rybkin on 19.12.2022.
//

import SwiftUI

struct NoItemsView: View {
	
	@State var animate: Bool = false
	
    var body: some View {
		ScrollView {
			VStack(spacing: 10) {
				Text("Жизнь прекрасна!")
					.font(.title)
					.fontWeight(.semibold)
					.padding()
				Text("У вас нет актуальных задач. Вам надо составить список, чтобы быть ещё более продуктивным.")
					.padding(.bottom, 20)
					.padding()
				NavigationLink(destination:
								AddView(),
							   label: {
					Text("Добавить задачу 💪")
						.foregroundColor(.white)
						.font(.headline)
						.frame(height: 55)
						.frame(maxWidth: .infinity)
						.background(animate ? Color.purple : Color.accentColor)
						.cornerRadius( animate ? 20 : 100)
				})
				.padding(.horizontal, animate ? 30 : 50)
				.shadow(color: animate ? Color.purple.opacity(0.7) :
							Color.accentColor.opacity(0.7),
						radius: animate ? 30 : 10,
						x: 0,
						y: animate ? 40 : 20)
				.scaleEffect(animate ? 1.1 : 1.0)
				.offset(y: animate ? -7 : 0)
			}
			.frame(maxWidth: 400)
			.multilineTextAlignment(.center)
			.padding(40)
			.onAppear(perform: addAnimation)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
	
	func addAnimation() {
		guard !animate else { return }
		DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
			withAnimation(
				Animation
					.easeInOut(duration: 1.0)
					.repeatForever()
			) {
				animate.toggle()
			}
		}
	}
	
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			NoItemsView()
				.navigationTitle("Todo List 📝")
		}
        NoItemsView()
    }
}
