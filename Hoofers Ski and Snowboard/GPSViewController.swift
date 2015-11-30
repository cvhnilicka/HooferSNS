//
//  GPSViewController.swift
//  Hoofers Ski and Snowboard
//
//  Created by Cormick Hnilicka on 11/25/15.
//  Copyright © 2015 Cormick Hnilicka. All rights reserved.
//

import UIKit
import GoogleMaps

class GPSViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {

    
   
    @IBOutlet weak var mapView: GMSMapView!

    @IBOutlet weak var MapType: UILabel!
    
    @IBOutlet weak var MapButton: UIButton!
   
    
    var locationmanager = CLLocationManager();
    
    var firstLocationUpdate: Bool?
    
    var didFindMyLocation = false
    
    var pageViewController: UIPageViewController!
    var pageTitle: NSArray!
    var pageImages: NSArray!
    
    var pageIndex = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self;
        mapView.animateToLocation(CLLocationCoordinate2DMake(43.4753, -110.7692));
        mapView.animateToZoom(8);
        
        self.locationmanager.delegate = self;
        self.locationmanager.requestWhenInUseAuthorization();
        
        mapView.addObserver(self, forKeyPath: "myLocation", options: NSKeyValueObservingOptions.New, context: nil);

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if !didFindMyLocation {
            let myLocation: CLLocation = change![NSKeyValueChangeNewKey] as! CLLocation
            mapView.camera = GMSCameraPosition.cameraWithTarget(myLocation.coordinate, zoom: 10.0)
            mapView.settings.myLocationButton = true
            
            didFindMyLocation = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            locationmanager.startUpdatingLocation()
            
            mapView.myLocationEnabled = true
            
        }
    }
    
    @IBAction func changeType(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "Map Types", message: "Select map type:", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let normalMapTypeAction = UIAlertAction(title: "Normal", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            self.mapView.mapType = kGMSTypeNormal
            self.MapButton.setTitle("Normal", forState: .Normal)
        }
        
        let terrainMapTypeAction = UIAlertAction(title: "Terrain", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            self.mapView.mapType = kGMSTypeTerrain
            self.MapButton.setTitle("Terrain", forState: .Normal)
        }
        
        let hybridMapTypeAction = UIAlertAction(title: "Hybrid", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            self.mapView.mapType = kGMSTypeHybrid
            self.MapButton.setTitle("Hybrid", forState: .Normal)
        }
        
        let cancelAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.Cancel) { (alertAction) -> Void in
            
        }
        
        actionSheet.addAction(normalMapTypeAction)
        actionSheet.addAction(terrainMapTypeAction)
        actionSheet.addAction(hybridMapTypeAction)
        actionSheet.addAction(cancelAction)
        
        presentViewController(actionSheet, animated: true, completion: nil)
        

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
