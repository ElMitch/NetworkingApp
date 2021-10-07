//
//  VersionsViewModel.swift
//  NetworkingApp
//
//  Created by Mitch Samaniego on 06/10/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import Foundation

class VersionsViewModel {
    
    var refreshData = { () -> () in  }
    
    var dataResponse: [Organization]? {
        didSet {
            refreshData()
        }
    }
    var total: Int?
    
    var showSpinner: Bool = true
    var organization = OrganizationService()
    var showErrorLabel: Bool {
        get {
            if dataResponse != nil && dataResponse!.isEmpty {
                return true
            }
            return false
        }
    }
    
    var errorMessage: String {
        return "Ha ocurrido un error mientras se descargaban los datos"
    }
    
    var numberOfCells: Int {
        get {
            return dataResponse?.count ?? 0
        }
    }
    
    func getNameOfOrganization(index: Int) -> String {
        return dataResponse?[index].organization ?? ""
    }
    
    func getDataSetOfOrganization(index: Int) -> String {
        return dataResponse?[index].dataset ?? ""
    }
    
    func fetchMore(page: Int) {
        showSpinner = true
        organization.fetchMoreOrganizations(page: page) { response in
            self.dataResponse?.append(contentsOf: response.results)
            self.refreshData()
            self.showSpinner = false
        }
    }
}
