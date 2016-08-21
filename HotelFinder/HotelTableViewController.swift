//
//  HotelTableViewController.swift
//  HotelFinder
//
//  Created by Roberto Merino on 20/8/16.
//  Copyright © 2016 Roberto Merino. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HotelTableViewController: UITableViewController {

    var hotels = [Hotel]()
    var city = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        loadHotels()
    }

    func loadHotels() {
        if city != "" {
            Alamofire.request(.GET, "http://www.macaws.net/hf/json/hotels.php", parameters: ["city": city])
                .responseJSON { response in
                    print(response.request)  // original URL request
                    print(response.response) // URL response
                    print(response.data)     // server data
                    
                    //response.data
                    //print(response.result)   // result of response serialization
                    //self.data = response.data
                    
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                    }
                    
                    let json = JSON(data: response.data!)
                    
                    //If json is .Dictionary
                    for (_,subJson):(String, JSON) in json {
                        // add new Meal
                        let newHotel = Hotel(name: subJson["name"].string!,
                            photo: nil)
                        
                        // Retrieve Image
                        Alamofire.request(.GET, subJson["urlImage"].string!)
                            .responseJSON {img in
                                // Create imagen with data
                                let imagen = UIImage(data: img.data!)
                                newHotel?.photo = imagen
                                self.hotels.append(newHotel!)
                                // Reload data Table
                                self.tableView.reloadData()
                                
                        }
                    }
            }

        }
        else {
            Alamofire.request(.GET, "http://www.macaws.net/hf/json/hotels.php")
                .responseJSON { response in
                    print(response.request)  // original URL request
                    print(response.response) // URL response
                    print(response.data)     // server data
                    
                    //response.data
                    //print(response.result)   // result of response serialization
                    //self.data = response.data
                    
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                    }
                    
                    let json = JSON(data: response.data!)
                    
                    //If json is .Dictionary
                    for (_,subJson):(String, JSON) in json {
                        // add new Meal
                        let newHotel = Hotel(name: subJson["name"].string!,
                            photo: nil)
                        
                        // Retrieve Image
                        Alamofire.request(.GET, subJson["urlImage"].string!)
                            .responseJSON {img in
                                // Create imagen with data
                                let imagen = UIImage(data: img.data!)
                                newHotel?.photo = imagen
                                self.hotels.append(newHotel!)
                                // Reload data Table
                                self.tableView.reloadData()
                                
                        }
                    }
            }

        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hotels.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "HotelTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! HotelTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let hotel = hotels[indexPath.row]
        
        cell.hotelNameLabel.text = hotel.name
        cell.hotelImage.image = hotel.photo
        
        
        return cell

    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            print("DETAILS")
            let hotelDetailViewController = segue.destinationViewController as! HotelViewController
            
            // Get the cell that generated this segue.
            if let selectedHotelCell = sender as? HotelTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedHotelCell)!
                let selectedHotel = hotels[indexPath.row]
                hotelDetailViewController.hotel = selectedHotel
            }
        }
        else if segue.identifier == "AddItem" {
            print("Adding new meal.")
        }
    }

    
}
