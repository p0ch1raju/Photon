//
//  FirstViewController.swift
//  Productivity App
//
//  Created by Rishi Pochiraju on 3/19/16.
//  Copyright © 2016 Rishi P. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    //use two different scroll views
    //top scroll view is for the calendar
    //bottom scroll view is for the current day: 12 AM to 12 AM for the date selected
    //use tags for each day...ex - March 27, 2015 tag is 32715
    //if sender.tag...look at tic tac toe game
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tabBarController!.tabBar.barTintColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.7)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

