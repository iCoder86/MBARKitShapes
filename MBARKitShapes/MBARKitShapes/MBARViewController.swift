//
//  MBARViewController.swift
//  MBARKitShapes
//
//  Created by Mehul on 08/10/17.
//  Copyright © 2017 Mehul. All rights reserved.
//

import UIKit

import ARKit

class MBARViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    var drawObjectIndex  =  String() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin,ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        
        print("\(drawObjectIndex)")
        
    }

    @IBAction func Add(_ sender: UIButton) {
        switch drawObjectIndex {
        case "Box": self.drawBox()
        case "Capsul": self.drawCapsul()
        case "Cone": self.drawCone()
        case "Cylinder": self.drawCylinder()
        case "Sphere": self.drawSphere()
        case "Tube": self.drawTube()
        case "Torus": self.drawTorus()
        case "Plane": self.drawPlane()
        case "Pyramid": self.drawPyramid()
        case "Bezier Path": self.drawPath()
        case "Relative Objects": self.drawRelitive()
        case "Custom Shape": self.drawCustomShape()
        default: self.drawBox()
        }
        
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        let x = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        let y = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        let z = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        node.position = SCNVector3(x,y,z)
        
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        self.reset()
    }
    
    func reset() {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func randomNumbers(firstNumber:CGFloat, secondNumber:CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNumber-secondNumber) + min(firstNumber,secondNumber)
    }
    
    func drawBox() {
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        let x = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        let y = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        let z = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        node.position = SCNVector3(x,y,z)
        
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    func drawCapsul() {
        let node = SCNNode()
        node.geometry = SCNCapsule(capRadius: 0.3, height: 0.2)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        //        let x = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let y = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let z = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)

        node.position = SCNVector3(0,0,-0.3)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    func drawCone() {
        let node = SCNNode()
        node.geometry = SCNCone(topRadius: 0.1, bottomRadius: 0.3, height: 0.2)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        //        let x = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let y = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let z = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        
        node.position = SCNVector3(0,0,-0.3)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    func drawCylinder() {
        let node = SCNNode()
        node.geometry = SCNCylinder(radius: 0.2, height: 0.3)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        //        let x = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let y = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let z = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)

        node.position = SCNVector3(0,0,-0.3)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    func drawSphere() {
        let node = SCNNode()
        node.geometry = SCNSphere(radius: 0.3)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        //        let x = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let y = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let z = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        
        node.position = SCNVector3(0,0,-0.3)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    func drawTube() {
        let node = SCNNode()
        node.geometry = SCNTube(innerRadius: 0.2, outerRadius: 0.3, height: 0.2)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        //        let x = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let y = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let z = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        
        node.position = SCNVector3(0,0,-0.3)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    func drawTorus() {
        let node = SCNNode()
        node.geometry = SCNTorus(ringRadius: 0.3, pipeRadius: 0.1)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        //        let x = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let y = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let z = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        
        node.position = SCNVector3(0,0,-0.7)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    func drawPlane() {
        let node = SCNNode()
        node.geometry = SCNPlane(width: 0.2, height: 0.2)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        //        let x = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let y = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let z = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        
        node.position = SCNVector3(0,0,-0.3)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    func drawPyramid() {
        let node = SCNNode()
        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        //        let x = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let y = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let z = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        
        node.position = SCNVector3(0,0,-0.3)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    func drawPath() {
        let node = SCNNode()
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.2))
        path.addLine(to: CGPoint(x: 0.2, y: 0.3))
        path.addLine(to: CGPoint(x: 0.4, y: 0.2))
        path.addLine(to: CGPoint(x: 0.4, y: 0))
        
        let shape = SCNShape(path: path, extrusionDepth: 0.2)
        node.geometry = shape
        
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        //        let x = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let y = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        //        let z = randomNumbers(firstNumber: -0.3, secondNumber: 0.3)
        
        node.position = SCNVector3(0,0,-0.7)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    func drawRelitive() {
        let cylinderNode = SCNNode(geometry: SCNCylinder(radius: 0.05, height: 0.05))
        cylinderNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        
        let node = SCNNode()
        
        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        node.position = SCNVector3(0.2,0.3,-0.2)
        cylinderNode.position = SCNVector3(-0.3,0.2,-0.3)
        self.sceneView.scene.rootNode.addChildNode(node)
        node.addChildNode(cylinderNode)
    }
    
    func drawCustomShape() {
        let doorNode = SCNNode(geometry: SCNPlane(width: 0.03, height: 0.06))
        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        
        let boxNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        let node = SCNNode()
        
        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        
        node.position = SCNVector3(0.2,0.3,-0.2)
        boxNode.position = SCNVector3(0,-0.05,0)
        doorNode.position = SCNVector3(0,-0.02,0.053)
        
        self.sceneView.scene.rootNode.addChildNode(node)
        node.addChildNode(boxNode)
        boxNode.addChildNode(doorNode)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
