//
//  AddView.swift
//  TodoList
//
//  Created by Yan Rybkin on 19.12.2022.
//

import SwiftUI

struct AddView: View {
	
	@Environment(\.presentationMode) var presentationMode
	@EnvironmentObject var listViewModel: ListViewModel
	@State var textFieldText: String = ""
	
	@State var alertTitle: String = ""
	@State var showAlert: Bool = false
	
	init() {
		UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
		
		UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
	}
	
	var body: some View {
		ZStack {
			LinearGradient(colors: [.black, .black, .purple],
						   startPoint: .top,
						   endPoint: .bottom)
			.edgesIgnoringSafeArea(.all)
			VStack {
				Spacer()
				TextField("Whrite something", text: $textFieldText)
					.padding(.horizontal)
					.frame(height: 55)
					.background(Color(.systemGray5))
					.cornerRadius(20)
				
				Button(action: {
					saveButtonPressed()
				}, label: {
					Text("Save")
						.foregroundColor(.white)
						.font(.title2)
						.frame(height: 55)
						.frame(maxWidth: .infinity)
						.background(Color.accentColor)
						.cornerRadius(20)
				}
				)
			}
			.padding()
			.navigationBarTitle("New task ✏️")
			.alert(isPresented: $showAlert, content: getAlert)
		}
	}
}

extension AddView {
	func saveButtonPressed() {
		if textIsAppropriate() {
			listViewModel.addItem(title: textFieldText)
			presentationMode.wrappedValue.dismiss()
		}
		
	}
	
	func textIsAppropriate() -> Bool {
		if textFieldText.count < 3 {
			alertTitle = "You must enter at least 3 characters! 😔"
			showAlert.toggle()
			return false
		}
		return true
	}
	
	func getAlert() -> Alert {
		return Alert(title: Text(alertTitle))
	}
}

struct AddView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			AddView()
		}
		.environmentObject(ListViewModel())
	}
}
