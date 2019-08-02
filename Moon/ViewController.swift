//
//  ViewController.swift
//  Moon
//
//  Created by eren on 2.08.2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var viewButtonContainer: UIView!
    let sphere = SCNSphere(radius: 0.2)
    var lastTag: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
        
//        let sphere = SCNSphere(radius: 0.2)
        
        let material = SCNMaterial()
        
        material.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpg")
        
        sphere.materials = [material]
        
        let node = SCNNode()
        
        node.position = SCNVector3(0, 0, -0.5)
        
        node.geometry = sphere
        
        sceneView.scene.rootNode.addChildNode(node)
        
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration        
        let configuration = ARWorldTrackingConfiguration.isSupported ? ARWorldTrackingConfiguration() : AROrientationTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    @IBAction func btnClicked(sender: UIButton) {
        print(sender.tag)
        if sender.tag == lastTag{
            return
        }else{
            lastTag = sender.tag
            
            if let material = sphere.materials.first{
                switch sender.tag{
                case 0:
                    material.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpg")
                case 1:
                    material.diffuse.contents = UIImage(named: "art.scnassets/8k_mars.jpg")
                case 2:
                    material.diffuse.contents = UIImage(named: "art.scnassets/8k_jupiter.jpg")
                default:
                    return
                }
                sphere.materials = [material]
            }
           
            
        }
        
    }
}
