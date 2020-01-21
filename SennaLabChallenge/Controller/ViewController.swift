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
        
        // No-storyboard approch as it is easier to maintain, less time spent rendering and better control when developing interface.

        view.backgroundColor = .white
        tableView.backgroundColor = #colorLiteral(red: 0.948936522, green: 0.9490727782, blue: 0.9489068389, alpha: 1)
        edgesForExtendedLayout = [.top, .bottom]
        extendedLayoutIncludesOpaqueBars = true
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.separatorColor = .clear
        navigationController?.navigationBar.isTranslucent = false
        title = "Restaurants"
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centerInSuperview()
        registerCells()

        // Using singletons helps reduce DRY code and better maintanability.
        Service.shared.getRestaurants { (restaurants, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let restaurants = restaurants else { return }
            self.restaurants = restaurants

            
            // tableView must be reloaded on the main thread.
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()

                self.tableView.reloadData()

            }
        }

    }


    fileprivate func registerCells() {
        tableView.register(RestaurantCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? RestaurantCell else { fatalError() }
        
        let restaurant = restaurants[indexPath.row]
        cell.restaurant = restaurant

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurant = restaurants[indexPath.row]
        let restauantDetailVC = RestaurantDetailViewController()
        restauantDetailVC.restaurant = restaurant
        navigationController?.present(restauantDetailVC, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    
    

    
}

