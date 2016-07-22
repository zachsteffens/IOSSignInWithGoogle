//
//  ProductsTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Zach-Mac Mini on 7/21/16.
//  Copyright © 2016 SteffensLLC. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let product1 = Product()
        let product2 = Product()
        let product3 = Product()
        let product4 = Product()
        
        product1.name = "1907 Wall Set"
        product1.productImage = "phone-fullscreen1"
        product1.cellImage = "image-cell1"
        
        product2.name = "1921 Dial Phone"
        product2.productImage = "phone-fullscreen2"
        product2.cellImage = "image-cell2"
        
        product3.name = "1937 Desk Set"
        product3.productImage = "phone-fullscreen3"
        product3.cellImage = "image-cell3"
        
        product4.name = "1984 Motorola Portable"
        product4.productImage = "phone-fullscreen4"
        product4.cellImage = "image-cell4"
        
        products = [product1, product2, product3, product4]
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //if productNames exists, return count. Otherwise, return 0
        if let p = products{
            return p.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //"ProductCell" matches identifier we added in the story board.
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath)
        
        //indexPath.row is current index number
        let product = products?[indexPath.row]
        
        if let p = product {
            cell.textLabel?.text = p.name
            if let i = p.cellImage {
                cell.imageView?.image = UIImage(named: i)
            }
            
        }
        
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //this is the name of the segue I defined in the story board by clicking on the circular icon after i right clicked and dragged from
        //tableviewcontroller to productViewController.
        if segue.identifier == "ShowProduct" {
            //specifing ? after the as makes productVC optional(as long as the cast worked it will be populated)
            let productVC = segue.destinationViewController as? ProductViewController
            
            //VERBOSE
            //let cell = sender as? UITableViewCell
            
            //if let c = cell {
            //    let indexPath = tableView.indexPathForCell(c)
            //    if let ip = indexPath {
            //        let productName = productNames?[ip.row]
            //        productVC?.productName = productName
            //    }
            //}
            
            //TERSE
            //if let cell = sender as? UITableViewCell {
            //    if let indexPath = tableView.indexPathForCell(cell) {
            //        productVC?.productName = productNames?[indexPath.row]
            //    }
            //}
            
            //EVEN MORE TERSE
            //this makes sure these variables exist and will always be safe to use after the guard statement.
            guard let cell = sender as? UITableViewCell,
                  let indexPath = tableView.indexPathForCell(cell) else {
                    return
            }
            productVC?.product = products?[indexPath.row]
            
        }
    }
    
}
