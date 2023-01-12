//
//  CellView.swift
//  MotivationApp
//
//  Created by Manal alwayeli on 18/06/1444 AH.
//

import SwiftUI

struct CardData: Identifiable {
    var id: String = UUID().uuidString
    
    // add the rest of the data associated with the cards, company, etc.
    
}

class CellViewModel: ObservableObject {
    
    @Published var card: CardData!
    @Published var isLiked = false
    
    func like() {
        isLiked.toggle()
    }
    
  
    
  
}

struct CellView: View{
    //MARK: - PROPERTIES


    @ObservedObject var cellViewModel: CellViewModel = CellViewModel()
    @State var favourites: [Quote] = []
   // @ObservedObject var model = QuoteModel()
    private var quote: [Quote] = Quote.allQuotes
    init(cardData: CardData) {
        self.cellViewModel.card = cardData

    }
//
//
//    //MARK: - BODY
    var body: some View{
        VStack{
//            VStack{
//                Image(systemName: "circle")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//
//                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("GrayWhite"), lineWidth: 0.5)
//                    )
//            }.background(Color.white)
//                .cornerRadius(10)
//
//
//            VStack{
//                HStack{
//
//                    Text(" ₽")
//                        .font(.system(size: 16, weight: .bold))
//                        .foregroundColor(Color("BlackWhite"))
//
//                    Spacer()
                    
                    Button(action: {
                        cellViewModel.like()
                        
                    }, label: {
                        Image(systemName: cellViewModel.isLiked ? "heart.fill" : "heart")
                            .frame(width: 50, height: 50)
                                                                        .overlay(Circle().stroke(.white, lineWidth: 1.0))
                                                                        .padding(10)
                            .foregroundColor(cellViewModel.isLiked ? .red : .white)
                    })
                }
                //.padding(.bottom, 1)
                
//                HStack{
//                    Text("company")
//                        .font(.system(size: 14, weight: .bold))
//                        .lineLimit(1)
//                        .foregroundColor(Color("BlackWhite"))
//                    Spacer()
//                }
//
//                HStack{
//                    Text("name")
//                        .font(.system(size: 14, weight: .bold))
//                        .lineLimit(1)
//                        .foregroundColor(.gray)
//                    Spacer()
//                }
//            }
//            .padding(.horizontal, 2)
//        }
//        .padding(5)
    }
    
    func aa () {
        
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cardData: CardData())
    }
}

