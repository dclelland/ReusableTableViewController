//
//  ReusableTableViewSection.swift
//  TREX
//
//  Created by Daniel Clelland on 3/09/17.
//  Copyright © 2017 Daniel Clelland. All rights reserved.
//

import UIKit
import Reusable

// MARK: - Reusable table view section

public protocol ReusableTableViewSection {
    
    associatedtype Row: ReusableTableViewRow
    
    var header: String? { get }
    
    var rows: [Row] { get }
    
    var footer: String? { get }
    
}

// MARK: Reusable table view section default implementation

extension ReusableTableViewSection {
    
    public var header: String? {
        return nil
    }
    
    public var footer: String? {
        return nil
    }
    
}
