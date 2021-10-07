//
//  VersionsViewController.swift
//  NetworkingApp
//
//  Created by Justin Peckner on 2/17/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import UIKit

class VersionsViewController: UIViewController {

    private let versionsView: VersionsView

    override func loadView() {
        view = versionsView
    }
    
    init(viewModel: VersionsViewModel) {
            versionsView = VersionsView(viewModel: viewModel)
            
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension VersionsViewController {

    func render() {
        // TODO: fill this in as needed during interview, including any desired method params
        versionsView.render()
    }

}
