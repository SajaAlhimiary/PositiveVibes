//
//  Favorites.swift
//  MotivationApp
//
//  Created by Manal alwayeli on 16/06/1444 AH.
//

import SwiftUI

struct Favorites: View {
    @Environment(\.dismiss) var dismiss
    // @State private var savedQuotes: [String] = []
    @State var favourites: [Quote] = []
    var body: some View {
        //
        VStack {
            HStack {
                Text("Favourites")
                    .bold().foregroundColor(.black)
                Spacer()
            }
            List(favourites, id: \.self) { currentQuote in
                VStack{
                    
                    Text(currentQuote.text)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    HStack {
                        Spacer()
                        Text("-")
                        Text(currentQuote.author).foregroundColor(.black)
                            .italic()
                    }
                }
            }
            
        }
        
    }
}


struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
