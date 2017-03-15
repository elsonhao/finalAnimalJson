//
//  ViewController.swift
//  finalAnimalJson
//
//  Created by 黃毓皓 on 2017/3/8.
//  Copyright © 2017年 ice elson. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController,GADBannerViewDelegate {

    @IBOutlet weak var animalTotal: UILabel!
    
    @IBOutlet weak var bannerView: GADBannerView!
    var getSecondeTableviewcontroller:SecondTableViewController!
    var animalArray:[animal] = []
    
    
    let Mywebadress = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=f4a75ba9-7721-4363-884d-c3820b0b917c"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //admob
        bannerView.delegate = self
        bannerView.adUnitID = "ca-app-pub-2285514931101689/4045103452"
        bannerView.rootViewController  = self
        bannerView.load(GADRequest())
        
        
        //證明viewDidLoad後,Uilabel已經生成,因為已經配屬記憶體
        print("123\(animalTotal)")
        
        downloadDataWithSession(webadress: Mywebadress)
        
    }
    
    func parseAnimalCountJson(Myjson:Any){
        if let jsonInfo =  Myjson as? [String:Any]{
            if let resultInfo = jsonInfo["result"] as? [String:Any]{
                if let totalCount = resultInfo["count"] as? Int {
                    DispatchQueue.main.async {
                        self.animalTotal.text = String(totalCount)
                    }
                }
            }
        }
    }
    
    func downloadDataWithSession(webadress:String){
        if let okUrl = URL(string: webadress){
            let task = URLSession.shared.dataTask(with: okUrl, completionHandler: { (data, response, error) in
                if error != nil{
                    print(error?.localizedDescription)
                }
                if let getdata = data{
                    do{
                      let json =  try JSONSerialization.jsonObject(with: getdata, options: [])
                        
                        self.parseJson(json: json)
                        self.parseAnimalCountJson(Myjson: json)
                    }catch{
                        
                    }
                    
                }
              
            })
            task.resume()
        }
    }
    
    func parseJson(json:Any){
        if let jsonInfo = json as? [String:Any]{
            if let result =  jsonInfo["result"] as? [String:Any]{
                if let results =  result["results"] as? [[String:String]]{
                    for getResultOne in results{
                        let animalObject = animal()
                        animalObject.Name = getResultOne["Name"]
                        animalObject.Age = getResultOne["Age"]
                        animalObject.Phone = getResultOne["Phone"]
                        animalObject.Note = getResultOne["Note"]
                        animalObject.ImageName = getResultOne["ImageName"]
                        animalObject.Sex = getResultOne["Sex"]
                        animalObject.Resettlement = getResultOne["Resettlement"]
                        animalArray.append(animalObject)

                    }
                    self.getSecondeTableviewcontroller.animalArray = self.animalArray
                    DispatchQueue.main.async {
                        self.getSecondeTableviewcontroller.tableView.reloadData()
                    }
                    
                    
                }
            }
        }
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        getSecondeTableviewcontroller = segue.destination as! SecondTableViewController     
    }

}













