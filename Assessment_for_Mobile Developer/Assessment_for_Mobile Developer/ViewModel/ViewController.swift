

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, User_Protocol {
    func DidChange(complition: [UniversityModel]) {
        DispatchQueue.main.async {
            // Fetch data from Realm on the main thread
            let realm = try! Realm()
            let results = realm.objects(UniversityModel.self)
            self.UserList = Array(results)
            self.tableview.reloadData()
        }
    }

    @IBOutlet weak var tableview: UITableView!
    var viewmodelobj = UserViewModel()
    var UserList: [UniversityModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "List")
        viewmodelobj.protocolObj = self
//        viewmodelobj.Api_call()
        DispatchQueue.main.async {
            // Fetch data from Realm on the main thread
            let realm = try! Realm()
            let results = realm.objects(UniversityModel.self)
            self.UserList = Array(results)
            self.tableview.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "List") as! UserTableViewCell
        cell.Uname.text = UserList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "List") as! UserTableViewCell
//        cell.obj =
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"DetailViewController") as? DetailViewController
        vc?.object = UserList[indexPath.row]
        UIApplication.topViewController()?.navigationController?.pushViewController(vc!, animated: true)

    }
    
    
}

