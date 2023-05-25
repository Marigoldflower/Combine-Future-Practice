//
//  NetworkManager.swift
//  Combine_Future_Practice
//
//  Created by 황홍필 on 2023/05/24.
//

import Foundation
import Combine
import Alamofire


class TeslaNetworkManager {
    
    static let shared = TeslaNetworkManager()
    // 여러객체를 추가적으로 생성하지 못하도록 설정
    private init() {}
    
    
    // "https://newsapi.org/v2/everything?q=tesla&from=2023-05-16&sortBy=publishedAt&apiKey=317fa039aea64f5383d896dca09a10e6"
    
    // 네트워크 통신 작업을 할 때 Future 타입을 사용해 비동기적인 작업을 처리해준다.
    func fetchNetwork() -> Future<[Article], Never> {
        
        let url = "https://newsapi.org/v2/everything?q=tesla&from=2023-05-16&sortBy=publishedAt&apiKey=317fa039aea64f5383d896dca09a10e6"
        
        return Future<[Article], Never> { promise in
            AF.request(url).validate().responseDecodable(of: TeslaModel.self) { response in
                switch response.result {
                case .success(let tesla):
                    print("통신이 성공적으로 이루어졌습니다!")
                    DispatchQueue.main.async {
                        promise(.success(tesla.articles))
                    }
                case .failure(let error):
                    print("에러가 발생했습니다 \(error)")
                }
                
            }
            
        }
    }
    
}





