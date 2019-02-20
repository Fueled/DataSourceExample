//
//  ExampleCollectionViewReusableView.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import DataSource
import ReactiveSwift
import UIKit

class ExampleCollectionViewReusableView: CollectionViewReusableView {

	@IBOutlet private var titleLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()

		let items = self.viewModel.producer
			.map { $0 as? String }
			.skipNil()

		self.titleLabel.reactive.text <~ items
	}

}
