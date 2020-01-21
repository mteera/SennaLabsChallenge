//
//  ViewController.swift
//  SennaLabChallenge
//
//  Created by Chace Teera on 20/01/2020.
//  Copyright © 2020 chaceteera. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        aiv.color = .darkGray
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    
    var restaurants = [Restaurant]()
    fileprivate var cellId = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        tableView.backgroundColor = #colorLiteral(red: 0.948936522, green: 0.9490727782, blue: 0.9489068389, alpha: 1)
        edgesForExtendedLayout = [.top, .bottom]
        extendedLayoutIncludesOpaqueBars = true
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.separatorColor = .clear

        view.addSubview(activityIndicatorView)
        
        activityIndicatorView.centerInSuperview()
        registerCells()

        Service.shared.getRestaurants { (restaurants, error) in
            guard let restaurants = restaurants else { return }
            self.restaurants = restaurants

            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()

                self.tableView.reloadData()

            }
        }

    }


    fileprivate func registerCells() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? CustomTableViewCell else { fatalError() }
        
        let restaurant = restaurants[indexPath.row]
        cell.restaurant = restaurant

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    
    

    
}

