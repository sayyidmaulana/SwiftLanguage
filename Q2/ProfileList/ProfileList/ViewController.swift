//
//  ViewController.swift
//  ProfileList
//
//  Created by Sayyid Maulana Khakul Yakin on 24/03/21.
//

import UIKit
import Moya

class ViewController: UIViewController {
    
    @IBOutlet weak var dataListProfile: UITableView!

    let url = MoyaProvider<ProfileBase>()
    
    var profileData: [ProfileElement] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callData()
        
        dataListProfile.delegate = self
        dataListProfile.dataSource = self
    }
    
    private func callData() {
        
        url.request(.profile) { result in
            switch result {
            case let .success(respon):
                do {
                    let response = try respon.filterSuccessfulStatusCodes()
                    let data = try response.map(Profile.self)
                    self.profileData = data
                    
                    DispatchQueue.main.async(execute: {
                        self.dataListProfile.reloadData()
                    })
        
                } catch {
                    print("there is something problem")
                }
                print(respon.debugDescription)
            case .failure(_):
                    print("there is no network signal")
            }
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "viewCell", for: indexPath) as! ViewCell
        let data = profileData[indexPath.row]
        cell.setupData(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
