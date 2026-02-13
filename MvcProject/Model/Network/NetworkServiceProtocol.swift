//
//  NetworkError.swift
//  MvcProject
//
//  Created by Софія Ярошович on 11.02.2026.
//  Copyright © 2026 MVPProject. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchRate(completion: @escaping (Result<ExchangeRate, Error>) -> Void)
}
