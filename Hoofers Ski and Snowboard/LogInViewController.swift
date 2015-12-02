//
//  LogInViewController.swift
//  Hoofers Ski and Snowboard
//
//  Created by Tyler Lane on 11/27/15.
//  Copyright © 2015 Cormick Hnilicka. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .ExtraLight)) as UIVisualEffectView
        
        visualEffectView.frame = backgroundImage.bounds
        
        //backgroundImage.addSubview(visualEffectView)
        
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
