//
//  UserTableViewCell.swift
//  Assessment_for_Mobile Developer
//
//  Created by Apple on 28/05/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var Uname: UILabel!
    @IBOutlet weak var Ustate: UILabel!
    var obj = UniversityModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupUI(obj:UniversityModel){
        self.Uname.text = obj.name
        self.Ustate.text = obj.stateProvince
    }
    
    @IBAction func NextButtonClick(_ sender: UIButton) {


    }
}

extension UIApplication {

     class func topViewController(_ viewController: UIViewController? = UIApplication.shared.connectedScenes
                             .filter({$0.activationState == .foregroundActive})
                             .compactMap({$0 as? UIWindowScene})
                             .first?.windows
                             .filter({$0.isKeyWindow}).first?.rootViewController) -> UIViewController? {
         if let nav = viewController as? UINavigationController {
             return topViewController(nav.visibleViewController)
         }
         if let tab = viewController as? UITabBarController {
             if let selected = tab.selectedViewController {
                 return topViewController(selected)
             }
         }
         if let presented = viewController?.presentedViewController {
             return topViewController(presented)
         }
         return viewController
     }
 }
