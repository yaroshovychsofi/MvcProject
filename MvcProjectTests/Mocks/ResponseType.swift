//
//  ResponseType.swift
//  MvcProject
//
//  Created by Софія Ярошович on 12.02.2026.
//  Copyright © 2026 MVPProject. All rights reserved.
//
@testable import MvcProject

enum ResponseType {
    case success(ExchangeRate)
    case failure(Error)
}
