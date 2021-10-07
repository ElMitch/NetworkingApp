//
//  OrganizationService.swift
//  NetworkingApp
//
//  Created by Mitch Samaniego on 06/10/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import Foundation


class OrganizationService {
    
    func fetchOrganizations(completion: @escaping (ResponseService) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            guard let url = URL(string: "https://api.datos.gob.mx/v1/gobmx.facts?pageSize=20&page=1") else { return }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let json = data else { return }
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(ResponseService.self, from: json)
                    completion(response)
                }  catch let error {
                    print("La estas cagando, mira: \(error.localizedDescription)")
                }
            }.resume()
        }
    }
    
    func fetchMoreOrganizations(page: Int, completion: @escaping (ResponseService) -> Void) {
        guard let url = URL(string: "https://api.datos.gob.mx/v1/gobmx.facts?pageSize=10&page=\(page)") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let json = data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(ResponseService.self, from: json)
                completion(response)
            }  catch let error {
                print("La estas cagando, mira: \(error.localizedDescription)")
            }
        }.resume()
    }
}

