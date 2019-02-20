//
//  InputFormSwitchCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import DataSource
import ReactiveSwift
import UIKit

class InputFormSwitchCell: TableViewCell {

	@IBOutlet private var titleLabel: UILabel!
	@IBOutlet private var switchControl: UISwitch!

	override func awakeFromNib() {
		super.awakeFromNib()

		let items = self.cellModel.producer
			.map { $0 as? InputFormBoolItem }
			.skipNil()

		self.titleLabel.reactive.text <~ items
			.map { $0.title }

		self.switchControl.reactive.isOn <~ items
			.flatMapLatest { $0.property.producer }
	}

	@IBAction private func onEditing(_ switchControl: UISwitch) {
		if let cellModel = self.cellModel.value as? InputFormBoolItem {
			cellModel.property.value = switchControl.isOn
		}
	}

}
