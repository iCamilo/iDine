// iDine
// Copyright ©️ 2024 Iván Camilo Fuertes. All rights reserved.


import SwiftUI

struct CheckOutView: View {
    private let paymentMethods = ["Cash", "Card", "Points"]
    private let tipAmounts = ["0", "5", "10", "15"]
    
    @EnvironmentObject var order: Order
    @State private var paymentMethod: String = "Cash"
    @State private var hasIDineCard: Bool = false
    @State private var iDineCardNumber: String = ""
    @State private var tipAmount: String = "5"
    @State private var showConfirmOrder: Bool = false
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipTotal = total / 100 * (Double(tipAmount) ?? 0)
        return (total + tipTotal).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section() {
                paymentMethodPicker
                
                iDineCardToggle
                
                if hasIDineCard {
                    iDineCardInputText
                }
            }
            
            Section("Add a Tip?") {
                tipPicker
            }
            
            Section("Total: \(totalPrice)") {
                confirmAction
            }
        }
        .alert("Order Confirmed", isPresented: $showConfirmOrder) {
            // no custom buttons
        } message: {
            confirmMessage
        }
        .navigationTitle("Check Out")
        .toolbarTitleDisplayMode(.inline)
    }
    
    private var paymentMethodPicker: some View {
        Picker("How do you want to pay?", selection: $paymentMethod) {
            ForEach(paymentMethods, id: \.self) { method in
                Text(method)
            }
        }
    }
    
    private var iDineCardToggle: some View {
        Toggle("Do you have a iDine card?", isOn: $hasIDineCard.animation())
    }
    
    private var iDineCardInputText: some View {
        TextField("iDineCard number", text: $iDineCardNumber)
    }
    
    private var tipPicker: some View {
        Picker("Percentage:", selection: $tipAmount) {
            ForEach(tipAmounts, id: \.self) { tip in
                Text("\(tip)%")
            }
        }
        .pickerStyle(.segmented)
    }
    
    private var confirmAction: some View {
        Button("Confirm Order") {
            showConfirmOrder.toggle()
        }
    }
    
    private var confirmMessage: some View {
        let iDineCardMessage = hasIDineCard ? "You used your iDineCard number \(iDineCardNumber)" : "You did not use an iDineCard"
        let confirmMessage = """
        Your order total was \(totalPrice).
        You payed using \(paymentMethod). 
        \(iDineCardMessage).
        You tipped \(tipAmount)%.
        
        Thanks!
        """
        
        return Text(confirmMessage)
    }
}

#Preview {
    return CheckOutView().environmentObject(Order.demoOrder)
}
