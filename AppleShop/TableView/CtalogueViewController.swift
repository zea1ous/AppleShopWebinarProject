//
//  ViewController.swift
//  AppleShop
//
//  Created by Alex Kolovatov on 24.01.2020.
//  Copyright © 2020 RagnaCode. All rights reserved.
//

import UIKit

class CtalogueViewController: UIViewController {
    
    let reuseIdentifier = "cellID"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(CatalogueTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Catalogue"
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tableView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: view.frame.height
        )
        
//        tableView.frame = view.frame
    }

}

extension CtalogueViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CatalogueTableViewCell
        else { return UITableViewCell() }
        
        cell.configure("iPhone 11", image: #imageLiteral(resourceName: "iphone-11"))
        
        return cell
    }
    
}

extension CtalogueViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath)
    }
    
}
