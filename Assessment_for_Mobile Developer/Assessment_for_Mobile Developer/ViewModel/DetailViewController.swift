//
//  DetailViewController.swift
//  Assessment_for_Mobile Developer
//
//  Created by Apple on 28/05/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var Uname: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var webpage: UILabel!
    @IBOutlet weak var code: UILabel!
    
    var object = UniversityModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Uname.text = object.name
        self.state.text = object.stateProvince
        self.country.text = object.country
        self.webpage.text = object.domains.first?.description
        self.code.text = object.alphaTwoCode
        
    }
    



}
