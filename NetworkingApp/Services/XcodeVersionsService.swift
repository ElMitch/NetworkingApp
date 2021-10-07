//
//  XcodeVersionsService.swift
//  NetworkingApp
//
//  Created by Justin Peckner on 2/17/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import Foundation

class XcodeVersionsService {

    func fetchVersions(completion: @escaping ([XcodeVersion]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            // Source for data in file: https://xcodereleases.com/data.json
            let fileURL = Bundle.main.url(forResource: "xcode_versions", withExtension: "json")!
            let data = try! Data(contentsOf: fileURL)
            let jsonDecoder = JSONDecoder()
            let versions = try! jsonDecoder.decode([XcodeVersion].self, from: data)
            completion(versions)
        }
    }

}
