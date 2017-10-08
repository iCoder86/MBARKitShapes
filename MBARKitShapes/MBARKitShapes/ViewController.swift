//
//  ViewController.swift
//  MBARKitShapes
//
//  Created by Mehul on 08/10/17.
//  Copyright © 2017 Mehul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView : UITableView!
    var data = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = ["Box","Capsul","Cone","Cylinder","Sphere","Tube","Torus","Plane","Pyramid","Bezier Path","Relative Objects","Custom Shape"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let index = sender as! IndexPath
        
        let viewController = segue.destination as! MBARViewController
        viewController.drawObjectIndex = data[index.row]
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell!
        cell.textLabel?.text = data[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Segue to the second view controller
        self.performSegue(withIdentifier: "MBARController", sender: indexPath)
    }
}
