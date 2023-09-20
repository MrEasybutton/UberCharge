//
//  AccountMenu.swift
//  UberCharge
//
//  Created by Tyler Kiong on 19/9/23.
//

import SwiftUI

struct AccountMenu: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthdate = Date()
    @State private var paymeth = ""
    @State private var finalname = ""
    @State var payby = "Undecided"
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Particulars")) {
                    Text(finalname)
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    DatePicker("Date of Birth", selection: $birthdate, displayedComponents: .date)
                }
                Section(header: Text("Billing")) {
                    Text("Payment By: " + payby)
                    Menu("Change Payment") {
                        Button("Uber") {
                            payby = "Uber"
                        }
                        Button("Cash") {
                            payby = "Cash"
                        }
                        Button("Undecided") {
                            payby = "Undecided"
                        }
                    }
                }
                Section(header: Text("Others")) {
                    Link("GitHub for this app", destination: URL(string: "https://github.com/BIGSHOTOF1997/UberCharge")!)
                }
                .tint(.brown)
            }
            .navigationTitle("Your Account")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Save", action: saveUser)
                        .bold()
                        .padding(4)
                }
            }
        }
        .accentColor(.red)
    }
    
    func saveUser() {
        print("User Saved")
        if (firstName != "" && lastName != "") {
            finalname = firstName + " " + lastName + " (Confirmed Name)"
        } else {
            finalname = "-"
        }
    }
}


struct AccountMenu_Previews: PreviewProvider {
    static var previews: some View {
        AccountMenu()
    }
}
