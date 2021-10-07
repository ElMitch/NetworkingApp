//
//  VersionsCoordinator.swift
//  NetworkingApp
//
//  Created by Justin Peckner on 2/17/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import UIKit

class VersionsCoordinator {

    enum State {
        case idle
        case loading
        case success
        case failure
    }

    private let versionsService = OrganizationService()
    private var viewModel: VersionsViewModel
    private var viewController: VersionsViewController
    
    private var state: State = .idle {
        didSet {
            // TODO: fill this in as needed during interview
            viewController.render()
        }
    }

    var rootViewController: UIViewController {
        viewController
    }
    
    init() {
            viewModel = VersionsViewModel()
            viewController = VersionsViewController(viewModel: viewModel)
        }

    func start() {
        // TODO: fill this in as needed during interview, including any desired method params
        state = .loading
        viewModel.showSpinner = true
        
        versionsService.fetchOrganizations {[weak self] response in
            self?.viewModel.dataResponse = response.results
            self?.viewModel.showSpinner = false
            self?.viewModel.total = response.pagination.total
            guard !response.results.isEmpty else {
                self?.state = .failure
                
                return
            }
            
            self?.state = .success
        }
    }

}
