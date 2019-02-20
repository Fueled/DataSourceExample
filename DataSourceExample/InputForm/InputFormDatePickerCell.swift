//
//  InputFormDatePickerCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 20/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import DataSource
import ReactiveSwift
import UIKit

class InputFormDatePickerCell: TableViewCell {

	@IBOutlet private var datePicker: UIDatePicker!

	override func awakeFromNib() {
		super.awakeFromNib()

		let items = self.cellModel.producer
			.map { $0 as? InputFormDateItem }
			.skipNil()

		self.datePicker.reactive.date <~ items
			.flatMapLatest { $0.property.producer }
	}

	func configure(value: Date) {
		self.datePicker?.date = value
	}

	@IBAction private func onEditing(_ datePicker: UIDatePicker) {
		if let item = self.cellModel.value as? InputFormDateItem {
			item.property.value = datePicker.date
		}
	}

}
