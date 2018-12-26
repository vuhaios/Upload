//
//  TableViewController.swift
//  TEST
//
//  Created by Vuha Sri on 12/25/18.
//  Copyright © 2018 Vuha Sri. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    var strregion = ""
    var strsubregion = ""
    var stralpha2 = ""
    var stralpha3 = ""

   
    @IBOutlet var tableCase: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
               getdata()
        
    }
    
    var arrdata = [jsonstruct]()
    
    func getdata(){
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{if error == nil{
                self.arrdata = try JSONDecoder().decode([jsonstruct].self, from: data!)
                
                for mainarr in self.arrdata{
                    //print(mainarr.name,":",mainarr.capital,":",mainarr.alpha3Code)
                    DispatchQueue.main.async {
                        self.tableCase.reloadData()
                    }
                    
                }
                }
                
            }catch{
                print("Error in get json data")
            }
            
            }.resume()
    }
    
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return self.arrdata.count
      
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let detail1 = tableCase.dequeueReusableCell(withIdentifier: "Second") as! TableViewCell
        detail1.strregion = "Region :\(arrdata[indexPath.row].region)"
        detail1.strsubregion = "SubRegion :\(arrdata[indexPath.row].subregion)"
        detail1.stralpha3 = "Alpha3code :\(arrdata[indexPath.row].alpha3Code)"
        detail1.stralpha2 = "Alpha2code :\(arrdata[indexPath.row].alpha2Code)"
        return detail1
        
    }
}

