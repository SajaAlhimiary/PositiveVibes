//
//  model.swift
//  MotivationApp
//
//  Created by Saja Alhimiary on 08/01/2023.
//

import Foundation

struct Quote: Codable, Hashable {
   // var id: Int
    //var id: String = UUID().uuidString
    var text, author: String
    
    static let allQuotes: [Quote] = Bundle.main.decode(file: "data.json")
    static let samplePerson: Quote = allQuotes[0]
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could Not Find the \(file) in project")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could Not Find the \(file) in project")
        }
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could Not Find the \(file) in project")
        }
        
        return decodedData
    }
}










//class ReadData: ObservableObject  {
//    @Published var quotes = [Quote]()
//
//
//    init(){
//        loadData()
//    }
//
//    func loadData()  {
//        guard let url = Bundle.main.url(forResource: "data", withExtension: "json")
//            else {
//                print("Json file not found")
//                return
//            }
//
//        let data = try? Data(contentsOf: url)
////        print(data)
//        let quotes = try? JSONDecoder().decode([Quote].self, from: data!)
////        print (quotes)
//        self.quotes = quotes!
//    }
//
//}
