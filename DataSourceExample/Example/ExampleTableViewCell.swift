//
//  ExampleTableViewCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveCocoa

class ExampleTableViewCell: TableViewCell {

	@IBOutlet var titleLabel: UILabel?

	let disposable = CompositeDisposable()

	deinit {
		disposable.dispose()
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		let items = self.item.producer
			.map { $0 as? ExampleItem }
			.ignoreNil()
		disposable += items.start(self, ExampleTableViewCell.configureWithItem)
		disposable += items.flatMap(.Latest) { $0.on.producer }
			.start(self, ExampleTableViewCell.configureWithOn)
	}

	func configureWithItem(item: ExampleItem) {
		self.titleLabel?.text = item.title
	}

	func configureWithOn(on: Bool) {
		self.accessoryType = on ? .Checkmark : .None
	}

}
