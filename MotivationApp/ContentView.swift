//
//  ContentView.swift
//  MotivationApp
//
//  Created by Manal alwayeli on 12/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
    
    private var quote: [Quote] = Quote.allQuotes
    @StateObject var viewModel = HomeViewModel()
    @State private var showingChangeBackground = false
    @State private var share = false
    //@State var favourites: [Quote] = []
    @State var ccurrenQuoteAddedToFavourites = false
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ZStack(alignment: .trailing) {
            
            Color.black.ignoresSafeArea()
            
            Image(viewModel.savedImageName)
                .resizable().opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .accessibility(label: Text("Black background"))
            
            VStack (alignment: .center){
                
                Image(systemName: "quote.bubble")
                    .imageScale(.large)
                    .foregroundColor(.white)
                    .font(.largeTitle).accessibilityLabel("Qoute")
                Spacer()
                
            }
            .padding(.top,100).padding(.trailing,165)
            Arrows().padding(.top,400).padding(.trailing,170)
            VTabView{
                ForEach(Array(quote.enumerated()), id: \.offset) { index, q in
                    VStack (alignment: .center){
                        Spacer()
                        Spacer()
                        VStack {
                            HStack {
                                Image(systemName: "quote.opening").foregroundColor(.white).padding(.top,-60).padding(.leading,10)
                                Text("\(q.text)")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.bold)
                                Image(systemName: "quote.closing").foregroundColor(.white).padding(.top,90)
                                .padding(.trailing,20) }
                            Text("\(q.author)")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 20))
                                .fontWeight(.light)
                                .padding()
                            }
                        .accessibilityElement(children: .combine)
                        Spacer()
                       
                        HStack{
                            
                            CellView(cardData: CardData()).accessibilityIdentifier("Favorite Quote button")
                                .padding(15)
                            Button {
                                self.actionSheet(
                                    quote: q.text,
                                    author: q.author
                                )
                                
                            } label: {
                                Image(systemName: "square.and.arrow.up")
                                    .imageScale(.large)
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 50)
                                    .overlay(Circle().stroke(.white, lineWidth: 1.0)).accessibilityIdentifier("Share button")
                            }
                            .padding(15)
                            
                            Button {
                                self.showingChangeBackground.toggle()
                            } label: {
                                Image(systemName: "photo.on.rectangle.angled")
                                    .imageScale(.large)
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 50)
                                    .overlay(Circle().stroke(.white, lineWidth: 1.0))
                                    .padding(19).accessibilityIdentifier("Change Background button")
                            }
                            .popover(isPresented: $showingChangeBackground, arrowEdge: .trailing) {
                                ChangeBackground(isPresenting: $showingChangeBackground)
                            }
                            
                        }
                        
                       
                        .padding(.trailing)
                        
                        
                    }
                    //.accessibilityElement(children: .combine)
                        .padding(10)
                    
                }
                
                
            }.tabViewStyle(.page(indexDisplayMode: .never))
            
            Button {
                ccurrenQuoteAddedToFavourites.toggle()
                
            } label:{
                
                Text("Favorites").foregroundColor(.white)
                    .frame(width: 90, height: 18)
                    .foregroundColor(.red).padding(.trailing,280).padding(.top,-350)
                
            }.fullScreenCover(isPresented: $ccurrenQuoteAddedToFavourites ){
                Favorites()
            }
            
            
        }
    }
    func actionSheet(quote: String, author: String) {
        let data = """
               Quote:
               
               \(quote)
               
               Author: \(author)
               
               
               """
        
        let activityVC = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        
        
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
    
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
