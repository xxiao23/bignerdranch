//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Xiang Xiao on 1/1/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  var mapView: MKMapView!
  
  override func loadView() {
    // Create a map view
    mapView = MKMapView()
    
    // Set it as *the* view of this view controller
    view = mapView
    
    let segmentedControl
      = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
    segmentedControl.backgroundColor
      = UIColor.white.withAlphaComponent(0.5)
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.addTarget(self,
                               action: #selector(MapViewController.mapTypeChanged(_:)),
                               for: .valueChanged)
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    let topConstraint
      = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 8)
    let leadingConstraint
      = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    let trailingConstraint
      = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
    switch segControl.selectedSegmentIndex {
    case 0:
      mapView.mapType = .standard
    case 1:
      mapView.mapType = .hybrid
    case 2:
      mapView.mapType = .satellite
    default:
      break
    }
  }
}
