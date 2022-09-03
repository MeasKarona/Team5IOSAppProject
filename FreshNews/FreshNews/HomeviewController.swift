//
//  HomeviewControllerViewController.swift
//  FreshNews
//
//  Created by MACBOOKAIR on 28/8/22.
//

import UIKit

class HomeviewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var newData = [NewsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(){
            print("success")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(newData.count)
        return newData.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "card_vc", for: indexPath) as! CardCell
        cell.configure(picture: newData[indexPath.row].image, title: newData[indexPath.row].newstitle)
        return cell
    }
    
    //event on each tableview
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        UIApplication.shared.open(URL(string: newData[indexPath.row].detail)!)
    }
    
    func getData(completed: @escaping () -> ()){
        let url = URL(string: "https://api.npoint.io/b0e6550e96ba50a22732")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do{
                self.newData = try JSONDecoder().decode([NewsModel].self, from: data)
                print(self.newData)
                DispatchQueue.main.async {
                    completed()
                }
            }
            catch{
                print("can't convert json")
                return
            }
            
        }
        task.resume()
    }

}

