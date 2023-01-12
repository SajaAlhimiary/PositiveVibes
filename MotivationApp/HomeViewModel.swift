//
//  HomeViewModel.swift
//  EveryDayQuotes
//
//  Created by Vladyslav Prosianyk on 02.07.2022.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var quotes: [Quote] = [] {
        willSet {
            if !newValue.isEmpty {
                isLoading = false
            }
        }
    }
    
    @Published var isLoading: Bool = true
    
    @Published var isNeedToBeDissmissed: Bool = false
    
    @Published var savedImageName: String = UserDefaults.standard.savedImageName {
        didSet{
            UserDefaults.standard.savedImageName = savedImageName
        }
    }
    
    private var bag = Set<AnyCancellable>()
    
    init() {
        setPublishers()
    }
    
    func setPublishers() {
        UserDefaults
            .standard
            .publisher(for: \.savedImageName)
            .sink { [weak self] newValue in
                guard let self = self else { return }
                if newValue != self.savedImageName {
                    self.savedImageName = newValue
                }
            }.store(in: &bag)
  
    }
  
}
