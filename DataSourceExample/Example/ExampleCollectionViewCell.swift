//
//  ExampleCollectionViewCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveCocoa

class ExampleCollectionViewCell: CollectionViewCell {

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
		disposable += items.start(self, ExampleCollectionViewCell.configureWithItem)
		disposable += items.flatMap(.Latest) { $0.on.producer }
			.start(self, ExampleCollectionViewCell.configureWithOn)
	}

	func configureWithItem(item: ExampleItem) {
		self.titleLabel?.text = item.title
	}

	func configureWithOn(on: Bool) {
		self.titleLabel?.textColor = on ? UIColor(red: 0.75, green: 0, blue: 0, alpha: 1) : UIColor.blackColor()
	}

	func updateBackground() {
		self.backgroundColor = self.highlighted || self.selected ? .lightGrayColor() : .groupTableViewBackgroundColor()
	}

	override var selected: Bool {
		didSet {
			self.updateBackground()
		}
	}

	override var highlighted: Bool {
		didSet {
			self.updateBackground()
		}
	}

}
