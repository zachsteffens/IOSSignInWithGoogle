//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by Zach-Mac Mini on 7/20/16.
//  Copyright © 2016 SteffensLLC. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let p = product {
            productNameLabel.text = p.name
            if let i = p.productImage {
                productImageView.image = UIImage(named: i)
            }
        }
                
        
    }
    @IBAction func addToCartPressed(sender: AnyObject){
        print("button tapped")
    }

}
