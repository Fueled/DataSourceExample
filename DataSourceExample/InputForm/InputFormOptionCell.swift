//
//  InputFormOptionCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 20/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import DataSource
import ReactiveSwift
import UIKit

class InputFormOptionCell: TableViewCell {

	@IBOutlet private var titleLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()

		let items = self.cellModel.producer
			.map { $0 as? InputFormOptionItemProtocol }
			.skipNil()

		self.titleLabel.reactive.text <~ items
			.map { $0.title }

		self.reactive.accessoryType <~ items
			.flatMapLatest { $0.current }
			.map { $0 ? .checkmark : .none }
	}

}
