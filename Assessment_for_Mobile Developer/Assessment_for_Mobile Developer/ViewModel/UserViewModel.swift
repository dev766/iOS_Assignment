//
//  UserViewModel.swift
//  Assessment_for_Mobile Developer
//
//  Created by Apple on 28/05/24.
//

import Foundation
import RealmSwift
protocol User_Protocol{
    func DidChange (complition:[UniversityModel])
}


class UserViewModel{
    
    var SpaceObj:[UniversityModel] = []
    var protocolObj : User_Protocol?

        func Api_call() {
        let url = URL(string: "http://universities.hipolabs.com/search?country=United%20States")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else {
                // Handle the error here
                print("Error fetching data: \(String(describing: error))")
                return
            }
            do {
                // Specify the expected type for decoded data
                let userData: [UniversityModel] = try JSONDecoder().decode([UniversityModel].self, from: data)
                DispatchQueue.main.async {
                    // Save to Realm on the main thread
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(userData, update: .modified)
                    }
                    // Notify delegate
                    self.protocolObj?.DidChange(complition: userData)
                }
            } catch {
                print("Error decoding data: \(error)") // More specific error message
            }
        }.resume()
    }

}

