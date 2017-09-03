//
//  ReusableTableViewController.swift
//  TREX
//
//  Created by Daniel Clelland on 3/09/17.
//  Copyright © 2017 Daniel Clelland. All rights reserved.
//

import UIKit
import RefreshableViewController
import Reusable

// MARK: - Reusable table view controller

open class ReusableTableViewController<Value, Section: ReusableTableViewSection>: RefreshableTableViewController<Value> {
    
    // MARK: Public state
    
    public var sections = [Section]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    public func section(at index: Int) -> Section {
        return sections[index]
    }
    
    public func row(at indexPath: IndexPath) -> Section.Row {
        return sections[indexPath.section].rows[indexPath.row]
    }
    
    // MARK: Initializers
    
    public convenience init(style: UITableViewStyle, sections: [Section]) {
        self.init(style: style)
        self.sections = sections
    }
    
    // MARK: Overrides
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(cellType: Section.Row.Cell.self)
    }
    
    override open func refreshState() {
        super.refreshState()
        // This should be overridden in subclasses
    }
    
    // MARK: - Table view data source
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection index: Int) -> Int {
        return section(at: index).rows.count
    }
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: Section.Row.Cell.self)
        row(at: indexPath).configure(cell: cell)
        return cell
    }
    
    override open func tableView(_ tableView: UITableView, titleForHeaderInSection index: Int) -> String? {
        return section(at: index).header
    }
    
    override open func tableView(_ tableView: UITableView, titleForFooterInSection index: Int) -> String? {
        return section(at: index).footer
    }
    
    // MARK: - Table view delegate
    
    override open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override open func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    override open func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        guard let row = row(at: indexPath) as? SelectableTableViewRow else {
            return false
        }
        return row.isSelectable(by: self)
    }
    
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let row = row(at: indexPath) as? SelectableTableViewRow else {
            return
        }
        row.selected(by: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override open func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {        guard let row = row(at: indexPath) as? CopyableTableViewRow else {
            return false
        }
        return row.pasteboardText != nil
    }
    
    override open func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return action == #selector(copy(_:))
    }
    
    override open func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        guard action == #selector(copy(_:)) else {
            return
        }
        guard let row = row(at: indexPath) as? CopyableTableViewRow else {
            return
        }
        UIPasteboard.general.string = row.pasteboardText
    }
    
}
