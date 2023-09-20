//
//  YourRide.swift
//  UberCharge
//
//  Created by Tyler Kiong on 20/9/23.
//

import SwiftUI

struct YourRide: View {
    
    let balance = 53.50
    let tripfare = 5.80
    @State private var tipme = 1.00
    
    
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    Text("Wallet")
                        .font(.system(size: 40))
                        .foregroundColor(.purple)
                }
                var localizedbalance = String(format: "%.2f", balance)
                var thefare = String(format: "%.2f", tripfare)
                var gst = (tripfare/100) * 8
                var thegst = String(format: "%.2f", gst)
                var tipmetoo = String(format: "%.2f", tipme)
                var total = tripfare + gst + tipme
                var thetotal = String(format: "%.2f", total)
                
                Section(header: Text("")) {
                    Text("Balance:")
                        .font(.system(size: 25))
                    Text("$" + localizedbalance)
                        .font(.system(size: 50))
                }
                Section(header: Text("")) {
                    Menu("Mode of Transportation") {
                        Button("Car") {
                            
                        }
                        Button("Train") {
                            
                        }
                        
                    }
                    .foregroundColor(.blue)
                }
                Section(header: Text("Payment for this trip").foregroundColor(.black)) {
                    Text("Trip Fare: $\(thefare)")
                        .font(.system(size: 22))
                    Text("GST: $\(thegst)")
                        .font(.system(size: 22))
                    Stepper("Tip: $\(tipmetoo)", value: $tipme, in: 1...10).foregroundColor(.red)
                        .font(.system(size: 22))
                    Text("Total     $\(thetotal)")
                        .font(.system(size: 40))
                }
                
            }
        }
        .foregroundColor(.green)
    }
}

struct YourRide_Previews: PreviewProvider {
    static var previews: some View {
        YourRide()
    }
}
