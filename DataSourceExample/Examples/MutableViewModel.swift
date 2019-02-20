//
//  MutableViewModel.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import DataSource
import ReactiveCocoa

final class MutableViewModel: ExampleViewModel {

	let title = "Mutable"

	var dataSource: DataSource {
		return mutableDataSource
	}

	lazy var actions: [ExampleViewModelAction] = {
		return [ExampleViewModelAction(title: "Insert") { [weak self] in self?.randomInsert() },
				ExampleViewModelAction(title: "Delete") { [weak self] in self?.randomDelete() },
				ExampleViewModelAction(title: "Move") { [weak self] in self?.randomMove() },
				ExampleViewModelAction(title: "Replace") { [weak self] in self?.randomReplace() }, ]
	}()

	let mutableDataSource = MutableDataSource(StaticData.randomItems())

	func randomInsert() {
		let itemsCount = mutableDataSource.items.value.count
		let randomNumber = random(itemsCount + 1)
		self.mutableDataSource.insertItem(StaticData.randomItem(), at: randomNumber)
	}

	func randomDelete() {
		let itemsCount = mutableDataSource.items.value.count
		if itemsCount >= 1 {
			let randomNumber = random(itemsCount)
			self.mutableDataSource.deleteItem(at: randomNumber)
		}
	}

	func randomMove() {
		let itemsCount = mutableDataSource.items.value.count
		if itemsCount >= 2 {
			let randomNumber = random(itemsCount)
			let randomNumber2 = random(itemsCount - 1)
			let destinationIndex = (randomNumber2 < randomNumber) ? randomNumber2 : (randomNumber2 + 1)
			self.mutableDataSource.moveItem(at: randomNumber, to: destinationIndex)
		}
	}

	func randomReplace() {
		let itemsCount = mutableDataSource.items.value.count
		if itemsCount >= 1 {
			let randomNumber = random(itemsCount)
			self.mutableDataSource.replaceItem(at: randomNumber, with: StaticData.randomItem())
		}
	}

}
