//
//  NoItemsView.swift
//  TodoList
//
//  Created by Yan Rybkin on 19.12.2022.
//

import SwiftUI

struct NoItemsView: View {
	@State var animate: Bool = false
	
	init() {
			UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

			UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
		}
	
    var body: some View {
		NavigationStack {
			ZStack {
				LinearGradient(colors: [.black, .black, .purple],
							   startPoint: .top,
							   endPoint: .bottom)
					.edgesIgnoringSafeArea(.all)
				VStack {
					VStack(spacing: 10) {
						Text("Life is Beautiful!")
							.foregroundColor(.white)
							.font(.title)
							.fontWeight(.semibold)
							.padding()
						Text("You don't have actual tasks. You need to make a list to be even more productive.")
							.foregroundColor(.white)
							.padding(.bottom, 20)
							.padding()
						
						Spacer()
						
						NavigationLink(destination:
										AddView(),
									   label: {
							Text("Add task 💪")
								.foregroundColor(.white)
								.font(.headline)
								.frame(height: 55)
								.frame(maxWidth: .infinity)
								.background(animate ? Color.purple : Color.accentColor)
								.cornerRadius( animate ? 20 : 100)
						}
						)
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
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.navigationTitle("Todo List 📝")
		}
    }
}

extension NoItemsView {
	func addAnimation() {
		guard !animate else { return }
		DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
			withAnimation(
				Animation
					.easeInOut(duration: 1.0)
					.repeatForever()
			)
			{
				animate.toggle()
			}
		}
	}
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
			NoItemsView()
    }
}
