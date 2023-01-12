//
//  ChangeBackground.swift
//  MotivationApp
//
//  Created by Manal alwayeli on 15/06/1444 AH.
//

import SwiftUI

struct ChangeBackground: View {
   
    private let imageNames: [String] = [
                "Black Background",
                "Sunny Background",
                "relaxing Background",
                "treeleaves Background",
                "lake Background",
                "Yoga Background",
                "beach Background",
                "sunset Background"
    ]
    
    private let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    @Binding var isPresenting: Bool
    
    var body: some View {
        VStack {
            Text("Choose Background")
                .font(.title.bold())
                .foregroundColor(.white)
//                .frame(maxWidth: .infinity, maxHeight: 70)
//                .background(.radialGradient(colors: [.purple, .blue, .cyan], center: .center, startRadius: 150, endRadius: 5))
//                .cornerRadius(10)
//                .shadow(color: .blue, radius: 6, x: 0, y: 3)
                .padding(20)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(imageNames, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .frame(width: 100, height: 190, alignment: .center).overlay(
                                RoundedRectangle(cornerRadius: 7).stroke(.white, lineWidth: 0.4))
                            //.cornerRadius(15)
                            .shadow(color: .black.opacity(0.6), radius: 6, x: 0, y: 2)
                            .onTapGesture {
                                UserDefaults.standard.savedImageName = imageName
                                self.isPresenting.toggle()
                            }
                    }
                }
                .padding(.horizontal)
                .frame(maxHeight: .infinity)
                .padding(10)
            }
        }
        .background(.black)
    }
}

struct ChangeBackground_Previews: PreviewProvider {
    static var previews: some View {
        ChangeBackground(isPresenting: .constant(true))
    }
}
