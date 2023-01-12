//
//  SplashScreen.swift
//  MotivationApp
//
//  Created by Manal alwayeli on 19/06/1444 AH.
//


import SwiftUI

struct SplashScreenView: View {
    @State var isActive : Bool = false
        @State private var size = 0.8
        @State private var opacity = 0.5
    var body: some View {
        if isActive {
                   ContentView()
               } else {
                   ZStack{
                       Color.black.ignoresSafeArea()
                       VStack {
                           VStack {
                               Image("SplashLogo")
                               Text("Get Inspired")
                                   .font(.title)
//                                   .font(Font.custom("Baskerville-Bold", size: 26))
                                   .fontWeight(.ultraLight)
                                   .foregroundColor(.white.opacity(0.80))
                                   .lineLimit(-11)
                           }
                           .scaleEffect(size)
                           .opacity(opacity)
                           .onAppear {
                               withAnimation(.easeIn(duration: 3)) {
                                   self.size = 0.9
                                   self.opacity = 1.00
                               }
                           }
                       }
                       .onAppear {
                           DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                               withAnimation {
                                   self.isActive = true
                               }
                           }
                       }
                   }
                   
               }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
