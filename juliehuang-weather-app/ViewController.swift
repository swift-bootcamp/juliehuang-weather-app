//
//  ViewController.swift
//  juliehuang-weather-app
//
//  Created by HUANG CHUNG HUI on 2014/8/16.
//  Copyright (c) 2014年 com.smart.h2. All rights reserved.
//

import UIKit

class ViewController: UIViewController , NSURLConnectionDelegate {
    
    var api:String = ""
    
    @IBOutlet var city: UILabel!
    @IBOutlet var temperature:UILabel!
    @IBOutlet var btn: UIButton!
    @IBOutlet var image: UIImageView!
    @IBOutlet var text:UITextField!
    
    // user nsmutabledata
    var data: NSMutableData = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        startConnection()
        // background image
        let background = UIImage(named: "background.jpeg")
        self.view.backgroundColor = UIColor(patternImage: background)
        
        
        self.city.text = "Taipei"
        //self.text.hidden = true
        self.image.image = UIImage( named: "sunny.jpeg" )
     //   self.btn.setImage(UIImage( named: "sunny.jpeg" ), forState: UIControlState.Normal)
        self.btn.setTitle("Taipei", forState: .Normal)
        self.btn.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        println("startconnection")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func buttonAction(sender:UIButton!)
    {
        if self.city.text == "Taipei"
        {
            self.city.text = "london"
            self.btn.setTitle("Taipei", forState: .Normal)
            startConnection()
         
        }
        else
        {
            self.city.text = "Taipei"
            self.btn.setTitle("London", forState: .Normal)
            startConnection()
         
        }
        println(self.text.text)
        
    }
    func startConnection(){
        var restAPI: String = "http://api.openweathermap.org/data/2.5/weather?q=" + self.city.text
        var url: NSURL = NSURL( string: restAPI)
        var request : NSURLRequest = NSURLRequest(URL: url)
        var connection:NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: true)
        
    }
    //download
    func connection(connection: NSURLConnection!,didReceiveData
        dataReceived: NSData!){
            println("downloading")
            
            self.data.setData(dataReceived)
            
            
    }
    func connectionDidFinishLoading(connection:NSURLConnection!){
        println("download finish")
        
        self.temperature.text = "2 weather downloading"
       // self.data.appendData(dataReceived)
        var json = NSString(data: data, encoding: NSUTF8StringEncoding)
        
        
        var error:NSError?
        var jsonDictionary = NSJSONSerialization.JSONObjectWithData(self.data, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
        
        let temp : AnyObject? = jsonDictionary["main"]?["temp"]
        
        //data
        let weatherTempCelsius = Int(round((temp!.floatValue-273.15)))
        let weatherEempFahrenheit = Int(round(((temp!.floatValue-273.15)*1.8)+32))
        self.temperature.text = "\(weatherTempCelsius)'C"
        
        /*
        let weather  =  jsonDictionary["weather"]? as NSArray
        if weather != nil {
        let weatherDictionary = (weather[0] as NSDictionary)
        let weatherId : Int = weatherDictionary["id"] as Int
        showImage(weatherId)
        }*/
        if let weather  =  jsonDictionary["weather"]? as? NSArray {
            let weatherDictionary = (weather[0] as NSDictionary)
            let weatherId : Int = weatherDictionary["id"] as Int
            // self.temperature.text = "\(weatherId)'C"
            showImage(weatherId)
        }

    }
    func showImage(weatherId : Int ){
        switch weatherId{
        case 803:
            self.image.image = UIImage( named: "less.jpeg" )
        case 500:
            self.image.image = UIImage( named: "black.jpeg" )
        default:
            self.image.image = UIImage( named: "black.jpeg" )
        }
    }
}

