//
//  ContactViewController.swift
//  GoodAsOldPhones
//
//  Created by Zach-Mac Mini on 7/21/16.
//  Copyright © 2016 SteffensLLC. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollView.contentSize = CGSizeMake(375,800)
    }

}