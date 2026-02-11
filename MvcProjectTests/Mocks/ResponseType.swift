//
//  ResponseType.swift
//  MvcProject
//
//  Created by Софія Ярошович on 12.02.2026.
//
@testable import MvcProject


enum ResponseType {
    case success(ExchangeRate)
    case failure(Error)
}
