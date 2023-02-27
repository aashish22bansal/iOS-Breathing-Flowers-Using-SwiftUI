//
//  ContentView.swift
//  Breathing Flowers
//
//  Created by Aashish Bansal on 27/02/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    // Handling the Petal Movements
    @State private var petal = false
    
    // Controlling the Breathing Labels
    @State private var breathInLabel = true
    @State private var breathOutLabel = false
    
    // Offset Breath from inside to outside
    @State private var offsetBreath = false
    
    // Control to transform image into cloud of smoke
    @State private var diffuseBreath = false
    
    // Controlling the Bouquet Animation
    @State private var breathTheBouquet = false
    
    var body: some View {
        ZStack {
            // Adding Winter Background
            Image("winterNight")
                .resizable()
                .aspectRatio(contentMode: .fill)
                //.frame(width: 400, height: 900)
            // Adding the Labels for breath in and breath out
            // Creating a ZStack for all the other needed Views
            // Calling the struct to create snow
            SnowView()
            
            ZStack{
                // MARK: - ANIMATE TEXT LABELS
                Group{
                    Text("Breath In")
                        .font(Font.custom("papyrus", size: 35))
                        .foregroundColor(.green)
                        .opacity(breathInLabel ? 0:1)
                        .scaleEffect(breathInLabel ? 0:1)
                        .offset(y: -160)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathInLabel)
                    
                    Text("Breath Out")
                        .font(Font.custom("papyrus", size: 35))
                        .foregroundColor(.orange)
                        .opacity(breathOutLabel ? 0:1)
                        .scaleEffect(breathOutLabel ? 0:1)
                        .offset(y: -160)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathOutLabel)
                }
                
                // Creating Smoke Animation
                // MARK: - CONVERT A STILL IMAGE INTO ANIMATED SMOKE (BREATH)
                Group{
                    Image("smoke")
                        .resizable()
                        .frame(width: 35, height: 125)
                        .offset(y: offsetBreath ? 90:0)
                        .animation(Animation.easeIn(duration: 2).delay(2).repeatForever(autoreverses: true), value: offsetBreath)
                        .blur(radius: diffuseBreath ? 1:60)
                        .offset(x: 0, y: diffuseBreath ? -50:-100)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: diffuseBreath)
                }.shadow(radius: diffuseBreath ? 20:0)
                
                // MARK: - CREATING PETALS
                Group{
                    /// one left of middle
                    PetalView(petal: $petal, degrees: petal ? -25:-5)
                    /// middle petal - fixed position
                    Image("petal")
                        .resizable()
                        .frame(width: 75, height: 125)
                    /// one right of the middle
                    PetalView(petal: $petal, degrees: petal ? 25:5)
                    /// two left from the middle
                    PetalView(petal: $petal, degrees: petal ? -50:-10)
                    /// two right from the middle
                    PetalView(petal: $petal, degrees: petal ? 50:10)
                }
                
                // MARK: - THE BOUQUET - MAKE IT BREATH TOO
                Group{
                    Image("bouquet")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 400)
                        .rotationEffect(.degrees(37))
                        .offset(x: -25, y: 90)
                        .scaleEffect(breathTheBouquet ? 1.04:1, anchor: .center)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: diffuseBreath)
                    
                    Image("bouquet")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 400)
                        .rotationEffect(.degrees(37))
                        .offset(x: -20, y: 95)
                        .rotation3DEffect(.degrees(180), axis: (x:0, y:1, z:0))
                        .scaleEffect(breathTheBouquet ? 1.02:1, anchor: .center)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathTheBouquet)
                }
            }
        }.onAppear(){ // Adding the Animation
            breathInLabel.toggle()
            breathOutLabel.toggle()
            offsetBreath.toggle()
            diffuseBreath.toggle()
            petal.toggle()
            breathTheBouquet.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
