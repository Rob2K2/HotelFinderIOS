//
//  HotelViewController.swift
//  HotelFinder
//
//  Created by Roberto Merino on 20/8/16.
//  Copyright © 2016 Roberto Merino. All rights reserved.
//

import UIKit

class HotelViewController: UIViewController {

    @IBOutlet weak var hotelNameLabel: UILabel!
    @IBOutlet weak var hotelImageView: UIImageView!
    
    var hotel: Hotel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up views if editing an existing Meal.
        if let hotel = hotel {
            navigationItem.title = hotel.name
            hotelNameLabel.text   = hotel.name
            hotelImageView.image = hotel.photo
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
