//
//  NetworkError.swift
//  MvcProject
//
//  Created by Софія Ярошович on 11.02.2026.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchRate(completion: @escaping (Result<ExchangeRate, Error>) -> Void)
}
