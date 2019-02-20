//
//  EditingViewController.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import DataSource
import UIKit

class EditingViewController: UIViewController, UITableViewDelegate {

	@IBOutlet private var tableView: UITableView?

	let tableDataSource = EditingTableViewDataSource()

	override func viewDidLoad() {
		super.viewDidLoad()
		if let tableView = self.tableView {
			tableView.estimatedRowHeight = 44
			tableView.rowHeight = UITableView.automaticDimension
			tableView.sectionHeaderHeight = UITableView.automaticDimension
			tableView.dataSource = self.tableDataSource
			self.tableDataSource.tableView = tableView
			tableView.isEditing = true
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tableView?.beginUpdates()
		self.tableView?.endUpdates()
	}

	@IBAction private func add() {
		self.tableDataSource.mutableDataSource.insertItem(StaticData.randomItem(), at: 0)
	}

}
