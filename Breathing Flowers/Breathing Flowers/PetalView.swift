//
//  PetalView.swift
//  Breathing Flowers
//
//  Created by Aashish Bansal on 27/02/23.
//

import SwiftUI

struct PetalView: View {
    
    // Binding Variable to connect to ContentView struct
    @Binding var petal: Bool
    
    // Variable to control the Degrees
    var degrees: Double = 0.0
    
    var body: some View {
        Image("petal")
            .resizable()
            .frame(width: 75, height: 125)
            .rotationEffect(.degrees(petal ? degrees:degrees), anchor: .bottom) // To create the Arc that opens and closes
            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: petal) // the degrees will set the arc and rotate
    }
}

struct PetalView_Previews: PreviewProvider {
    static var previews: some View {
        PetalView(petal: .constant(true))
    }
}
