//
//  ViewModel.swift
//  Combine_Future_Practice
//
//  Created by 황홍필 on 2023/05/24.
//




import Foundation
import Combine
import Alamofire


class TeslaViewModel {
    
    private var cancellables: Set<AnyCancellable> = []
    @Published var networkPublisher: [Article] = []
    
    func fetchNetwork() {
        TeslaNetworkManager.shared.fetchNetwork().sink { [weak self] tesla in
            self?.networkPublisher = tesla
        }.store(in: &cancellables)
    }
}

