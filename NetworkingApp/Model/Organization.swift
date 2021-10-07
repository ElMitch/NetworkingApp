//
//  Organization.swift
//  NetworkingApp
//
//  Created by Mitch Samaniego on 06/10/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import Foundation

struct ResponseService: Codable, Hashable {
    let pagination: Pagination
    let results: [Organization]
    
    enum CodingKeys: String, CodingKey {
        case pagination, results
    }
}

struct Pagination: Codable, Hashable {
    let pageSize: Int
    let page: Int
    let total: Int
    
    enum CodingKeys: String, CodingKey {
        case pageSize, page, total
    }
}


struct Organization: Codable, Hashable {
    let id: String
    let date: String
    let slug: String
    let columns: String
    let fact: String
    let organization: String
    let resource: String
    let url: String
    let operations: String
    let dataset: String
    let created: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case date = "date_insert"
        case slug, columns, fact, organization, resource, url, operations, dataset
        case created = "created_at"
    }
}

