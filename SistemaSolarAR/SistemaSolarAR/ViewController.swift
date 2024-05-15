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
        
        //Sol
        let sun = planet(geometry: SCNSphere(radius: 0.35), diffuse: UIImage(named: "sun"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0, 0, -1))
        self.sceneView.scene.rootNode.addChildNode(sun)
        
        //Tierra
        let earthParent = SCNNode()
        earthParent.position = SCNVector3(0, 0, -1)
        let earthParentRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 14)
        let foreverEarth = SCNAction.repeatForever(earthParentRotation)
        earthParent.runAction(foreverEarth)
        self.sceneView.scene.rootNode.addChildNode(earthParent)
        let earth = planet(geometry: SCNSphere(radius: 0.2), diffuse: UIImage(named: "tierra dia"), specular: UIImage(named: "tierra specular"), emission: UIImage(named: "tierra nubes"), normal: UIImage(named: "tierra normal"), position: SCNVector3(1.2, 0, 0))
        
        earthParent.addChildNode(earth)
        let earthRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 12)
        let foreverEarthRotation = SCNAction.repeatForever(earthRotation)
        earth.runAction(foreverEarthRotation)
        
        // Mercurio
        let mercurioParent = SCNNode()
        mercurioParent.position = SCNVector3(0, 0, -1)
        let mercurioParentRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 8)
        let foreverMercurio = SCNAction.repeatForever(mercurioParentRotation)
        mercurioParent.runAction(foreverMercurio)
        self.sceneView.scene.rootNode.addChildNode(mercurioParent)
        let mercurio = planet(geometry: SCNSphere(radius: 0.05), diffuse: UIImage(named: "mercurio"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0.5, 0, 0))
        mercurioParent.addChildNode(mercurio)
        
        //Venus
        let venusParent = SCNNode()
        venusParent.position = SCNVector3(0, 0, -1)
        let venusParentRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 10)
        let foreverVenus = SCNAction.repeatForever(venusParentRotation)
        venusParent.runAction(foreverVenus)
        self.sceneView.scene.rootNode.addChildNode(venusParent)
        let venus = planet(geometry: SCNSphere(radius: 0.1), diffuse: UIImage(named: "venus"), specular: nil, emission: UIImage(named: "venus atm"), normal: nil, position: SCNVector3(0.7, 0, 0))
        
        venusParent.addChildNode(venus)
        
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 50)
        let forever = SCNAction.repeatForever(action)
        sun.runAction(forever)
        
        // Marte
        let marteParent = SCNNode()
        marteParent.position = SCNVector3(0, 0, -1)
        let marteParentRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 24)
        let foreverMarte = SCNAction.repeatForever(marteParentRotation)
        marteParent.runAction(foreverMarte)
        self.sceneView.scene.rootNode.addChildNode(marteParent)
        let marte = planet(geometry: SCNSphere(radius: 0.1), diffuse: UIImage(named: "marte"), specular: nil, emission: nil, normal: nil, position: SCNVector3(1.5, 0, 0))
        marteParent.addChildNode(marte)

        // Luna
        let luna = planet(geometry: SCNSphere(radius: 0.04), diffuse: UIImage(named: "moon"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0.3, 0, 0))
        let lunaParentRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 4)
        let foreverLuna = SCNAction.repeatForever(lunaParentRotation)
        luna.runAction(foreverLuna)
        earth.addChildNode(luna)
        
        // Júpiter
        let jupiterParent = SCNNode()
        jupiterParent.position = SCNVector3(0, 0, -1)
        let jupiterParentRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 30)
        let foreverJupiter = SCNAction.repeatForever(jupiterParentRotation)
        jupiterParent.runAction(foreverJupiter)
        self.sceneView.scene.rootNode.addChildNode(jupiterParent)
        let jupiter = planet(geometry: SCNSphere(radius: 0.2), diffuse: UIImage(named: "jupiter"), specular: nil, emission: nil, normal: nil, position: SCNVector3(2.0, 0, 0))
        jupiterParent.addChildNode(jupiter)
        
        // Saturno
        let saturnoParent = SCNNode()
        saturnoParent.position = SCNVector3(0, 0, -1)
        let saturnoParentRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 35)
        let foreverSaturno = SCNAction.repeatForever(saturnoParentRotation)
        saturnoParent.runAction(foreverSaturno)
        self.sceneView.scene.rootNode.addChildNode(saturnoParent)
        let saturno = planet(geometry: SCNSphere(radius: 0.18), diffuse: UIImage(named: "saturno"), specular: nil, emission: nil, normal: nil, position: SCNVector3(2.5, 0, 0))
        saturnoParent.addChildNode(saturno)

        // Anillos de Saturno
        let anillo = SCNNode(geometry: SCNTube(innerRadius: 0.23, outerRadius: 0.3, height: 0.01))
        anillo.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "anillos")
        anillo.position = SCNVector3(0, 0, 0)
        saturno.addChildNode(anillo)
        
        // Urano
        let uranoParent = SCNNode()
        uranoParent.position = SCNVector3(0, 0, -1)
        let uranoParentRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 40)
        let foreverUrano = SCNAction.repeatForever(uranoParentRotation)
        uranoParent.runAction(foreverUrano)
        self.sceneView.scene.rootNode.addChildNode(uranoParent)
        let urano = planet(geometry: SCNSphere(radius: 0.16), diffuse: UIImage(named: "urano"), specular: nil, emission: nil, normal: nil, position: SCNVector3(3.0, 0, 0))
        uranoParent.addChildNode(urano)

        // Neptuno
        let neptunoParent = SCNNode()
        neptunoParent.position = SCNVector3(0, 0, -1)
        let neptunoParentRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 45)
        let foreverNeptuno = SCNAction.repeatForever(neptunoParentRotation)
        neptunoParent.runAction(foreverNeptuno)
        self.sceneView.scene.rootNode.addChildNode(neptunoParent)
        let neptuno = planet(geometry: SCNSphere(radius: 0.15), diffuse: UIImage(named: "neptuno"), specular: nil, emission: nil, normal: nil, position: SCNVector3(3.5, 0, 0))
        neptunoParent.addChildNode(neptuno)
        
        // Plutón
        let plutonParent = SCNNode()
        plutonParent.position = SCNVector3(0, 0, -1)
        let plutonParentRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 50)
        let foreverPluton = SCNAction.repeatForever(plutonParentRotation)
        plutonParent.runAction(foreverPluton)
        self.sceneView.scene.rootNode.addChildNode(plutonParent)
        let pluton = planet(geometry: SCNSphere(radius: 0.05), diffuse: UIImage(named: "pluton"), specular: nil, emission: nil, normal: nil, position: SCNVector3(4.0, 0, 0))
        plutonParent.addChildNode(pluton)
        
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


extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180 }
}
