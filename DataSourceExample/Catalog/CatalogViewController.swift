//
//  CatalogViewController.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 15/06/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource

class CatalogViewController: UIViewController {

    @IBOutlet var tableView: UITableView?
    
    let dataSource = TableViewDataSource()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.dataSource.dataSource.innerDataSource.value = StaticDataSource(items: [
            CatalogItem(title: "Static (items)") { StaticItemsViewModel() },
            CatalogItem(title: "Static (sections)") { StaticSectionsViewModel() },
            CatalogItem(title: "Proxy") { ProxyViewModel() },
            CatalogItem(title: "Auto Diff") { AutoDiffViewModel() }
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource.tableView = self.tableView
        self.tableView?.dataSource = self.dataSource
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView?.deselectAllRows(animated)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let nc = segue.destinationViewController as? UINavigationController,
            vc = nc.topViewController as? ExampleViewController,
            cell = sender as? CatalogCell,
            item = cell.item.value as? CatalogItem
            where segue.identifier == "ShowExampleSegue"
        {
            vc.viewModel = item.viewModel()
        }
    }
    
}
