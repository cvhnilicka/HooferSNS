//
//  RouteInfoViewController.swift
//  Hoofers Ski and Snowboard
//
//  Created by Cormick Hnilicka on 11/28/15.
//  Copyright © 2015 Cormick Hnilicka. All rights reserved.
//

import UIKit

class RouteInfoViewController: UIViewController {

    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    var pageIndex = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
