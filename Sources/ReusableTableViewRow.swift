//
//  ReusableTableViewRow.swift
//  TREX
//
//  Created by Daniel Clelland on 3/09/17.
//  Copyright © 2017 Daniel Clelland. All rights reserved.
//

import UIKit
import Reusable

// MARK: - Reusable table view row

public protocol ReusableTableViewRow {
    
    associatedtype Cell: UITableViewCell, Reusable
    
    func configure(cell: Cell)
    
}

// MARK: - Selectable table view row

public protocol SelectableTableViewRow {
    
    func isSelectable(by viewController: UIViewController) -> Bool
    
    func selected(by viewController: UIViewController)
    
}

// MARK: - Copyable table view row

public protocol CopyableTableViewRow {
    
    var pasteboardText: String? { get }
    
}
