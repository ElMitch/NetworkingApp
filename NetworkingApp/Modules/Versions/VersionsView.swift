//
//  VersionsView.swift
//  NetworkingApp
//
//  Created by Justin Peckner on 2/17/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import UIKit

class VersionsView: UIView {

    private let spinner = UIActivityIndicatorView(style: .medium)
    private let tableView = UITableView()
    private let textLabel = UILabel()
    private var viewModel = VersionsViewModel()
    private let identifierCell = "organizationTableCell"
    private var page = 2

    init(viewModel: VersionsViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        setupTable()
        setupSpinner()
        setupTextLabel()
        setupStyling()
    }

    private func setupTable() {
        addSubviewAndEdgeConstraints(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifierCell)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupSpinner() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        addSubview(spinner)
        addConstraints([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func setupTextLabel() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        addConstraints([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func setupStyling() {
        backgroundColor = .white
        spinner.backgroundColor = .clear
        tableView.backgroundColor = .clear
        textLabel.backgroundColor = .clear
    }
}

extension VersionsView {

    func render() {
        // TODO: fill this in as needed during interview, including any desired method params
        if viewModel.showSpinner {
            spinner.startAnimating()
            tableView.isHidden = true
        }
        else {
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                self.tableView.isHidden = false
                self.tableView.reloadData()
            }
        }
        
        guard !viewModel.showErrorLabel else {
            tableView.isHidden = true
            textLabel.text = viewModel.errorMessage
            return
        }
    }
}

extension VersionsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: identifierCell)
        cell.selectionStyle = .none
        cell.textLabel?.text = viewModel.getNameOfOrganization(index: indexPath.row)
        cell.detailTextLabel?.text = viewModel.getDataSetOfOrganization(index: indexPath.row)
        cell.detailTextLabel?.numberOfLines = 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if viewModel.numberOfCells == indexPath.row + 1 {
            page += 1
            if ((page * 10) + 10) < viewModel.total ?? 0 {
                viewModel.fetchMore(page: page)
                viewModel.refreshData = { [weak self] () in
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }
        }
    }
}
