//
//  ViewController.swift
//  Inventory
//
//  Created by Sayyid Maulana Khakul Yakin on 24/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataInventory: UITableView!
    
    var data: [InventoryElement] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupData()
    }
    
    private func setupData() {

        let myUrl = URL(string: invent)
        var request = URLRequest(url: myUrl!)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                
                
                let JSONData = try JSONDecoder().decode(Inventory.self, from: data)
                
                self.data = JSONData
                
                DispatchQueue.main.async {
                    self.dataInventory.reloadData()

                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "viewCell", for: indexPath) as! ViewCell
        let invData = data[indexPath.item]
        cell.setupData(data: invData)
        return cell
    }
    
    
}
