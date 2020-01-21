//
//  RestaurantDetailViewController.swift
//  SennaLabChallenge
//
//  Created by Chace Teera on 21/01/2020.
//  Copyright © 2020 chaceteera. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UITableViewController {
    
    // Using variables rather than explicit string helps reduce the chance for mistakes and for better maintainablity.
    fileprivate var headerCellId = "headerCell"
    fileprivate var metaCellId = "metaCell"
    fileprivate var menuCellId = "menuCell"
    
    var restaurant: Restaurant? {
        didSet {
            guard let restaurant = restaurant else { return }
            title = restaurant.name
            // Using singletons helps reduce repetitive use of code and better maintanability.
            Service.shared.getRestaurantBy(id: restaurant.id) { (restaurant, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                DispatchQueue.main.async {
                    self.restaurant = restaurant
                    self.tableView.reloadData()
                }
                
            }

        }
    }

    //Using enum to handle the section makes for easier reading and better maintainability especially when dealing with different types of sections.
    enum TableSection: Int {
        case header
        case meta
        case menus
        case total
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()

    }
    
    fileprivate func registerCells() {
        tableView.register(HeaderCell.self, forCellReuseIdentifier: headerCellId)
        tableView.register(MetaCell.self, forCellReuseIdentifier: metaCellId)
        tableView.register(MenuCell.self, forCellReuseIdentifier: menuCellId)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return TableSection.total.rawValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case TableSection.menus.rawValue:
            if let menus = restaurant?.menus {
                
                return menus.count
            }
            
            return Int()
        default:
           return 1

        }

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell
        
        switch indexPath.section {
        case TableSection.header.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: headerCellId) as? HeaderCell else { fatalError() }
            
            cell.restaurant = self.restaurant

            return cell
            
            case TableSection.meta.rawValue:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: metaCellId) as? MetaCell else { fatalError() }
                
            cell.restaurant = self.restaurant
                

            return cell
            
            case TableSection.menus.rawValue:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: menuCellId) as? MenuCell else { fatalError() }
                
                if let menus = self.restaurant?.menus  {
                    let menu = menus[indexPath.row]
                    cell.menu = menu

                }
                
                return cell
        default:
            break
        }
        
        cell = UITableViewCell()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case TableSection.header.rawValue:
            return 200
            
        case TableSection.meta.rawValue:
            return UITableView.automaticDimension
        case TableSection.menus.rawValue:
            return 100
        default:
            return CGFloat()

        }
    }
    


}
