//
//  ViewController.swift
//  juliehuang-weather-app
//
//  Created by HUANG CHUNG HUI on 2014/8/16.
//  Copyright (c) 2014年 com.smart.h2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var api:String = ""
    
    @IBOutlet var city: UILabel!
    @IBOutlet var btn: UIButton!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.city.text = "taipei"
        btn.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func buttonAction(sender:UIButton!)
    {
        self.city.text = "linko"
    }

}

