//
//  ViewController.swift
//  SistemaSolarAR
//
//  Created by Liquid on 14/5/24.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
        
        self.sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let sun = planet(geometry: SCNSphere(radius: 0.35), diffuse: UIImage(named: "sun"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0, 0, -1))
        
        
        let earth = planet(geometry: SCNSphere(radius: 0.2), diffuse: UIImage(named: "tierra diffuse"), specular: UIImage(named: "tierra specular"), emission: UIImage(named: "tierra emission"), normal: UIImage(named: "tierra normal"), position: SCNVector3(1.2, 0, 0))
        
        sun.addChildNode(earth)
        
        let venus = planet(geometry: SCNSphere(radius: 0.1), diffuse: UIImage(named: "venus"), specular: nil, emission: UIImage(named: "venus atm"), normal: nil, position: SCNVector3(0.7, 0, 0))
        
        sun.addChildNode(venus)
        
        
        
    }

    func planet(geometry: SCNGeometry, diffuse: UIImage?, specular: UIImage?, emission: UIImage?, normal: UIImage?, position: SCNVector3) -> SCNNode {
        let planet = SCNNode(geometry: geometry)
        planet.geometry?.firstMaterial?.diffuse.contents = diffuse
        planet.geometry?.firstMaterial?.specular.contents = specular
        planet.geometry?.firstMaterial?.emission.contents = emission
        planet.geometry?.firstMaterial?.normal.contents = normal
        planet.position = position
        
        return planet
    }

}

