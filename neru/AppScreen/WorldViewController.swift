//
//  WorldViewController.swift
//  neruneru
//
//  Created by Kirie Miyajima on 2018/04/20.
//  Copyright © 2018年 Remi Higuchi. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class WorldViewController: UIViewController, MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    let myTableView:UITableView = UITableView()
    
    let mapView:MKMapView = MKMapView()
    
    let titles:[String] = [
        "Total sleep time",
        "Total distance (walk)",
        "Now"
    ]
    
    let text:[String] = [
        "102:40",
        "460km",
        "Kyoto -Kiyomizu temple"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.themeColor
        self.title = "WORLD"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        //mapview
        mapView.frame = CGRect(x: 0, y: 0, width: width, height: height/10*6)
        
        let myLat: CLLocationDegrees = 34.994702
        let myLon: CLLocationDegrees = 135.785032
        let myCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLat, myLon)
        
        
        mapView.centerCoordinate = myCoordinate
        mapView.delegate = self
        
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        
        // MapViewで指定した中心位置とMKCoordinateSapnで宣言したspanを指定する.
        let region : MKCoordinateRegion = MKCoordinateRegion(center: myCoordinate, span: span)
        
        mapView.region = region
        
        //annotation
        let nowAnnotation:MKPointAnnotation = MKPointAnnotation()
        nowAnnotation.title = "now"
        nowAnnotation.coordinate = myCoordinate
        mapView.addAnnotation(nowAnnotation)
        
        let bedAnnotation:MKPointAnnotation = MKPointAnnotation()
        let bedCordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(35.672334, 139.758486)
        bedAnnotation.coordinate = bedCordinate
        bedAnnotation.title = "bed"
        mapView.addAnnotation(bedAnnotation)
        
        self.view.addSubview(mapView)
        
        myTableView.frame = CGRect(x: 0, y: height/10*6, width: width, height: height/10*4)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        self.view.addSubview(myTableView)
        
        
        
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let myIdentifier = "myPin"
        
        var myAnnotation: MKAnnotationView!
        
        // annotationが見つからなかったら新しくannotationを生成.
        if myAnnotation == nil {
            myAnnotation = MKAnnotationView(annotation: annotation, reuseIdentifier: myIdentifier)
        }
        
    
        // 画像を選択.
        
        if annotation.title == "bed" {
            myAnnotation.image = #imageLiteral(resourceName: "bed")
        }else{
            myAnnotation.image = #imageLiteral(resourceName: "now")
        }
        
         myAnnotation.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        myAnnotation.annotation = annotation
        
        return myAnnotation
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: "MyCell")
        cell.textLabel?.text = titles[indexPath.row]
        cell.detailTextLabel?.text = text[indexPath.row]
        return cell
    }
    
    
    
    
}
