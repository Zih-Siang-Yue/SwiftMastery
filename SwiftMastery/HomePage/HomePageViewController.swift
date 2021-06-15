//
//  HomePageViewController.swift
//  SwiftMastery
//
//  Created by Sean.Yue on 2021/2/25.
//

import UIKit

class HomePageViewController: BaseViewController {
    
    let tableView: UITableView
    
    private var viewModel: HomePageViewModel

    init(vm: HomePageViewModel) {
        self.viewModel = vm
        self.tableView = UITableView()
        super.init(nibName: "HomePageViewController", bundle: nil)  //純code 創建, 但因為沒有給viewModel 所以需要呼叫super 特定的init
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.setupTableView()
    }
    
    func setupTableView() {
//        self.tableView.registerNib(cellType: <#T##T.Type#>)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 30
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)

        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }

}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        self.viewModel.cellVMs
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
