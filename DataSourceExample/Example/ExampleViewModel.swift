//
//  ExampleViewModel.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import DataSource
import Foundation

protocol ExampleViewModel: AnyObject {

	var title: String { get }
	var dataSource: DataSource { get }
	var actions: [ExampleViewModelAction] { get }

}
