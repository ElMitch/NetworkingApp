//
//  UIView+Layout.swift
//  NetworkingApp
//
//  Created by Justin Peckner on 2/17/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import UIKit

extension UIView {

    func addSubviewAndEdgeConstraints(_ view: UIView, with insets: UIEdgeInsets = UIEdgeInsets.zero) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addEdgeConstraints(to: self, with: insets)
    }

    func addEdgeConstraints(to view: UIView, with insets: UIEdgeInsets) {
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: insets.right).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor, constant: insets.top).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom).isActive = true
    }

}
