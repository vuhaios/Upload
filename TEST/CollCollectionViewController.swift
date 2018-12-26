//
//  CollCollectionViewController.swift
//  TEST
//
//  Created by Vuha Sri on 12/24/18.
//  Copyright © 2018 Vuha Sri. All rights reserved.
//

import UIKit
struct jsonstruct:Decodable {
    let name:String
    let capital:String
    let alpha2Code:String
    let alpha3Code:String
    let region:String
    let subregion:String
    
}

private let reuseIdentifier = "Cell"

class CollCollectionViewController: UICollectionViewController {
   
    var arrdata = [jsonstruct]()
    @IBOutlet var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        getdata()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

     
    }
    func getdata(){
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{if error == nil{
                self.arrdata = try JSONDecoder().decode([jsonstruct].self, from: data!)
                
                for mainarr in self.arrdata{
                    //print(mainarr.name,":",mainarr.capital,":",mainarr.alpha3Code)
                    DispatchQueue.main.async {
                        self.tableview.reloadData()
                    }
                    
                }
                }
                
            }catch{
                print("Error in get json data")
            }
            
            }.resume()
    }
    
    

 

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
       
        return cell
    }

    
}
