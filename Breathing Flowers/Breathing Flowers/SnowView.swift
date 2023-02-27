//
//  SnowView.swift
//  Breathing Flowers
//
//  Created by Aashish Bansal on 27/02/23.
//

import SwiftUI

struct SnowView: UIViewRepresentableProtocol {
    func makeUIView(context: Context) -> some UIView{
        // Configuring the Screen
        /// Constant to hold the bounds of the screen
        let screen = UIScreen.main.bounds
        
        /// View to return once the method is complete
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screen.width, height: screen.height))
        
        /// indicating if sublayers are clipped to the layers bound
        view.layer.masksToBounds = true
        
        // Creating snow
        let emitter = CAEmitterLayer()
        /// setting size and location for emitter
        emitter.frame = CGRect(x: 200, y: -100, width: view.frame.width, height: view.frame.height)
        
        /// Configuring the Snoflake as a Cell
        let cell = CAEmitterCell() /// Creating the Instance
        cell.birthRate = 40
        cell.lifetime = 25
        cell.velocity = 60
        cell.scale = 0.025 /// This tells how big we want the cell to be.
        cell.emissionRange = CGFloat.pi /// This refers to how far we want to spread the cells as they are being emitted (here the emission range is set to 180 degrees)
        cell.contents = UIImage(named: "snow")?.cgImage /// Sets the image to the Image of our choice
        emitter.emitterCells = [cell] /// Adds all the cells configured into an Array
        view.layer?.addSublayer(emitter) /// Adds all the cells to the top layer
        
        // returning view
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context){}
}

struct SnowView_Previews: PreviewProvider {
    static var previews: some View {
        SnowView().background(Color.black)
    }
}
