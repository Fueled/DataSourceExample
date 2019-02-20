//
//  StaticData.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 17/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation

enum StaticData {

	static let items = [
		"Great Pyramid of Giza",
		"Hanging Gardens of Babylon",
		"Statue of Zeus at Olympia",
		"Temple of Artemis at Ephesus",
		"Mausoleum at Halicarnassus",
		"Colossus of Rhodes",
		"Lighthouse of Alexandria",
	].map { ExampleItem($0) }

	static func randomItem() -> ExampleItem {
		return items[random(items.count)]
	}

	static func randomItems() -> [ExampleItem] {
		let randomNumber = 3 + random(7)
		return (0 ..< randomNumber).map { _ in self.randomItem() }
	}

}
