//
//  NetworkService.swift
//  MvcProject
//
//  Created by Софія Ярошович on 11.02.2026.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    func fetchRate(completion: @escaping (Result<ExchangeRate, any Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let success = Bool.random()
            if success {
                let rate = ExchangeRate(from: "USD",
                                        to: "UAH",
                                        rate: Double.random(in: 40.0...45.0))
                DispatchQueue.main.async {
                    completion(.success(rate))
                }

            }
            else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.serverError))
                }
            }
        }
    }
}
