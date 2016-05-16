//
//  SecondViewController.swift
//  Productivity App
//
//  Created by Rishi Pochiraju on 3/19/16.
//  Copyright © 2016 Rishi P. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var clockHandImage: UIImageView!
    
    @IBOutlet var displayHandTime: UILabel!
    
    let pi = 3.14159265358979323846264338327950288419716939937510582
    let deg = 0.01745329251
    
    let radius = 130.5
    let a = 188.0 //center x
    let b = 335.5 //center y
    let c = 188.0 //top x
    let d = 205.0 //top y
    //these may have to be changed depending on where the point for rotation is
    
    var angle = 0.0
    
    var userTime = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.MediumStyle)
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position:CGPoint = touch.preciseLocationInView(view)
            let x = Double(position.x)
            let y = Double(position.y)
            
            let center1 = (a - x)*(a - x)
            let center2 = (b - y)*(b - y)
            let distanceFromCenter = sqrt(center1 + center2)
            
            let top1 = (c - x)*(c - x)
            let top2 = (d - y)*(d - y)
            let distanceFromTop = sqrt(top1 + top2)
            
            let numerator = (radius * radius) + (distanceFromCenter * distanceFromCenter) - (distanceFromTop * distanceFromTop)
            let denominator = 2 * radius * distanceFromCenter
            let divide = numerator/denominator
            
            angle = acos(divide) * 180/pi
            
            if (x < 188.0){
                angle = 360 - angle
            }
            
            var transformation = CGAffineTransformMakeTranslation(0, 61)
            transformation = CGAffineTransformRotate(transformation, CGFloat(deg*angle))
            transformation = CGAffineTransformTranslate(transformation,0,-61)
            clockHandImage.transform = transformation
            
            
            let first = userTime.componentsSeparatedByString(" ")
            print(first)
            let next = first[3].componentsSeparatedByString(":")
            var amOrPm = first[4]
            
            
            var hours =  Int(next[0])!
            var minutes = Int(angle/2) + Int(next[1])!
            
            if (minutes >= 60){
                hours = hours + 1
                minutes = minutes - 60
                if (minutes >= 60){
                    hours = hours + 1
                    minutes = minutes - 60
                    if (minutes >= 60){
                        hours = hours + 1
                        minutes = minutes - 60
                    }
                }
            }
            
            if (Int(next[0])! != 12){
                if (hours >= 12){
                    if (amOrPm == "AM"){
                        amOrPm = "PM"
                    }else{
                        amOrPm = "AM"
                    }
                    if (hours > 12){
                        hours = hours - 12
                    }
                }
            }
            
            if (hours == Int(next[0])! && minutes == Int(next[1])! - 1){
                hours = hours + 3
                if (hours >= 12){
                    if (amOrPm == "AM"){
                        amOrPm = "PM"
                    }else{
                        amOrPm = "AM"
                    }
                    if (hours > 12){
                        hours = hours - 12
                    }
                }
            }
            
            if (hours > 12){
                hours = hours - 12
            }
            
            if (minutes < 10){
                displayHandTime.text = String(hours) + ":0" + String(minutes) + " " + amOrPm
            }else{
                displayHandTime.text = String(hours) + ":" + String(minutes) + " " + amOrPm
            }

        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let position:CGPoint = touch.preciseLocationInView(view)
            let x = Double(position.x)
            let y = Double(position.y)
            
            let center1 = (a - x)*(a - x)
            let center2 = (b - y)*(b - y)
            let distanceFromCenter = sqrt(center1 + center2)
            
            let top1 = (c - x)*(c - x)
            let top2 = (d - y)*(d - y)
            let distanceFromTop = sqrt(top1 + top2)
            
            let numerator = (radius * radius) + (distanceFromCenter * distanceFromCenter) - (distanceFromTop * distanceFromTop)
            let denominator = 2 * radius * distanceFromCenter
            let divide = numerator/denominator
            
            angle = acos(divide) * 180/pi
            
            if (x < 188.0){
                angle = 360 - angle
            }
            
            var transformation = CGAffineTransformMakeTranslation(0, 61)
            transformation = CGAffineTransformRotate(transformation, CGFloat(deg*angle))
            transformation = CGAffineTransformTranslate(transformation,0,-61)
            clockHandImage.transform = transformation
            
            
            let first = userTime.componentsSeparatedByString(" ")
            let next = first[3].componentsSeparatedByString(":")
            var amOrPm = first[4]
            
            
            var hours =  Int(next[0])!
            var minutes = Int(angle/2) + Int(next[1])!
            
            if (minutes >= 60){
                hours = hours + 1
                minutes = minutes - 60
                if (minutes >= 60){
                    hours = hours + 1
                    minutes = minutes - 60
                    if (minutes >= 60){
                        hours = hours + 1
                        minutes = minutes - 60
                    }
                }
            }
            
            if (Int(next[0])! != 12){
                if (hours >= 12){
                    if (amOrPm == "AM"){
                        amOrPm = "PM"
                    }else{
                        amOrPm = "AM"
                    }
                    if (hours > 12){
                        hours = hours - 12
                    }
                }
            }
            
            if (hours == Int(next[0])! && minutes == Int(next[1])! - 1){
                hours = hours + 3
                if (hours >= 12){
                    if (amOrPm == "AM"){
                        amOrPm = "PM"
                    }else{
                        amOrPm = "AM"
                    }
                    if (hours > 12){
                        hours = hours - 12
                    }
                }
            }
            
            if (hours > 12){
                hours = hours - 12
            }
            
            if (minutes < 10){
                displayHandTime.text = String(hours) + ":0" + String(minutes) + " " + amOrPm
            }else{
                displayHandTime.text = String(hours) + ":" + String(minutes) + " " + amOrPm
            }
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController!.tabBar.barTintColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.7)
        
        userTime = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.MediumStyle)
        
        var one = userTime.componentsSeparatedByString(" ")
        var two = one[3].componentsSeparatedByString(":")
        displayHandTime.text = two[0] + ":" + two[1] + " " + one[4]
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}