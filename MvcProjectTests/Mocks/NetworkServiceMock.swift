//
//  NetworkServiceMock.swift
//  MvcProject
//
//  Created by Софія Ярошович on 11.02.2026.
//

@testable import MvcProject
import Foundation

class NetworkServiceMock: NetworkServiceProtocol {
    var response: ResponseType
    var fetchRateCalled: Bool = false
    
    init(response: ResponseType) {
        self.response = response
    }
    func fetchRate(completion: @escaping (Result<MvcProject.ExchangeRate, any Error>) -> Void) {
        fetchRateCalled = true
        DispatchQueue.main.async {
            switch self.response {
            case .success(let rate):
                completion(.success(rate))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
