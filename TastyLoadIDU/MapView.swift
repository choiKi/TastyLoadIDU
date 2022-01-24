//
//  MapView.swift
//  TastyLoadIDU
//
//  Created by 최기훈 on 2022/01/16.
//

import UIKit
import MapKit
import CoreLocation


class MapView: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var mapTitle:UILabel!
    
    var mapText: String?
    var destination: String?
    var type: Int = 0
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        myMap.showsUserLocation = true
        self.myMap.delegate = self
        showDestination()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        addressLabel.text = self.mapText
        mapTitle.text = self.destination
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double)-> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle:String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate =  goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first{
            manager.stopUpdatingLocation()
            
            render(location)
        }
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            
            })
        locationManager.stopUpdatingLocation()
    }
    
    func render(_ location: CLLocation) {
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        myMap.setRegion(region, animated: true)
        
    }
    func showDestination() {
        switch type {
        case 1:
            setAnnotation(latitudeValue: 37.63390, longitudeValue: 127.05826, delta: 0.007, title: "하다식당", subtitle: "\(mapText!)")
        case 2:
            setAnnotation(latitudeValue: 37.63392, longitudeValue: 127.057760, delta: 0.001, title: "민들레 초밥", subtitle: "\(mapText!)")
        case 3:
            setAnnotation(latitudeValue: 37.63395, longitudeValue: 127.05813, delta: 0.01, title: "밥은화", subtitle: "\(mapText!)")
        case 4:
            setAnnotation(latitudeValue: 37.634063, longitudeValue: 127.058431, delta: 0.01, title: "갱스터 떡볶이", subtitle: "\(mapText!)")
        case 5:
            setAnnotation(latitudeValue: 37.63108, longitudeValue: 127.05828, delta: 0.01, title: "노랑통닭", subtitle: "\(mapText!)")
        case 6:
            setAnnotation(latitudeValue: 37.62925, longitudeValue: 127.05884, delta: 0.01, title: "곤지암 소머리국밥 & 순대국", subtitle: "\(mapText!)")
        case 7:
            setAnnotation(latitudeValue: 37.630056, longitudeValue: 127.058365, delta: 0.01, title: "토박이 순대국", subtitle: "\(mapText!)")
        case 8:
            setAnnotation(latitudeValue: 37.63273, longitudeValue: 127.05852, delta: 0.01, title: "휘경 곱창", subtitle: "\(mapText!)")
        case 9:
            setAnnotation(latitudeValue: 37.63295, longitudeValue: 127.05172, delta: 0.01, title: "피자굽는 오빠", subtitle: "\(mapText!)")
        case 10:
            setAnnotation(latitudeValue: 37.63295, longitudeValue: 127.05172, delta: 0.01, title: "보배반점", subtitle: "\(mapText!)")
        default:
            return
        }
    }
    
    
}
