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
	
	var body: some View {
		ZStack {
			LinearGradient(gradient: Gradient(colors: [ .white, .blue]),
						   startPoint: .center,
						   endPoint: .bottom)
			.ignoresSafeArea()
			ScrollView {
				VStack {
					TextField("Напишите что-нибудь", text: $textFieldText)
						.padding(.horizontal)
						.frame(height: 55)
						.background(Color(.systemGray4))
						.cornerRadius(20)
					Button(action: {
						saveButtonPressed()
					}, label: {
						Text("Сохранить")
							.foregroundColor(.white)
							.font(.title2)
							.frame(height: 55)
							.frame(maxWidth: .infinity)
							.background(Color.accentColor)
							.cornerRadius(20)
					})
				}
				.padding()
			}
			.navigationBarTitle("Новая задача ✏️")
			.alert(isPresented: $showAlert, content: getAlert)
		}
	}
	
	func saveButtonPressed() {
		if textIsAppropriate() {
			listViewModel.addItem(title: textFieldText)
			presentationMode.wrappedValue.dismiss()
		}

	}
	
	func textIsAppropriate() -> Bool {
		if textFieldText.count < 3 {
			alertTitle = "Надо ввести хотя бы 3 символа! 😔"
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
