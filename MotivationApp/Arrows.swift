//
//  Arrows.swift
//  MotivationApp
//
//  Created by Saja Alhimiary on 11/01/2023.
//

import SwiftUI

struct ArrowShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: -20, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 20))
        path.addLine(to: CGPoint(x: 20, y: 0))
        
        return path
    }
}

struct Arrows: View {
    private let arrowCount = 1
    @State var scale:CGFloat = 1.0
    @State var fade:Double = 0.5
    @State var isActive : Bool = false
    @State private var color = Color.white
    var body: some View {
        
        ZStack {
//            Color(.black).edgesIgnoringSafeArea(.all)
            
            HStack{
                ForEach(0..<self.arrowCount) { i in
                    ArrowShape()
                        .stroke(style: StrokeStyle(lineWidth: CGFloat(10),
                                                   lineCap: .round,
                                                   lineJoin: .round ))
                        .foregroundColor(color)
                        .aspectRatio(CGSize(width: 28, height: 100), contentMode: .fit)
                        .frame(maxWidth: 20)
                        .animation(nil)
                        .opacity(self.fade)
                        .scaleEffect(self.scale)
                        .animation(
                            Animation.easeOut(duration: 0.8)
                                .repeatForever(autoreverses: true)
                                .delay(0.2 * Double(i))
                        )
                }
            }
            .onAppear {
                withAnimation(.easeIn(duration: 1)) {
                    self.scale = 1.2
                    self.fade = 1.0

                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    color = .clear
                    self.isActive = true
                }
            }
        }
    }
}



struct Arrows_Previews : PreviewProvider {
    static var previews: some View {
        Arrows()
    }
}
