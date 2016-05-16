//
//  TaskListViewController.swift
//  Productivity App
//
//  Created by Srinivas Pochiraju on 3/27/16.
//  Copyright © 2016 Rishi P. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController {
    
    @IBAction func makeNewNote(sender: AnyObject) {
        print("Clicked")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController!.tabBar.barTintColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.7)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
