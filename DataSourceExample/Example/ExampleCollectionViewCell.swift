//
//  ExampleCollectionViewCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import DataSource
import ReactiveSwift
import UIKit

class ExampleCollectionViewCell: CollectionViewCell {

	@IBOutlet private var titleLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()

		let items = self.cellModel.producer
			.map { $0 as? ExampleItem }
			.skipNil()

		self.titleLabel.reactive.text <~ items
			.map { $0.title }

		self.titleLabel.reactive.textColor <~ items
			.flatMapLatest { $0.on.producer }
			.map { $0 ? UIColor.DataSourceExample.red : UIColor.black }
	}

	func updateBackground() {
		self.backgroundColor = (self.isHighlighted || self.isSelected) ? .lightGray : .groupTableViewBackground
	}

	override var isSelected: Bool {
		didSet {
			self.updateBackground()
		}
	}

	override var isHighlighted: Bool {
		didSet {
			self.updateBackground()
		}
	}

}
