//
//  SecondTableViewController.swift
//  finalAnimalJson
//
//  Created by 黃毓皓 on 2017/3/8.
//  Copyright © 2017年 ice elson. All rights reserved.
//

import UIKit

class SecondTableViewController: UITableViewController {

    var animalArray:[animal]? = []
    var imageData:[Data]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return animalArray?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetail", sender: indexPath.row)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let  myDetailTableViewController = segue.destination as! DetailTableViewController
        
        let nowSelectRow = sender as! Int
        //將animal物件陣列傳給下一頁
        myDetailTableViewController.myArrayInfo = animalArray?[nowSelectRow]
        myDetailTableViewController.imageArray = imageData
        myDetailTableViewController.nowIndex = nowSelectRow
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        if animalArray?[indexPath.row].Name != ""{
        cell.animalName.text = animalArray?[indexPath.row].Name
        }else{
            cell.animalName.text = "待取名"
        }
        // 讓圖片一開始顯示為空的,再秀出圖片
        cell.animalImage.image = nil
        
        //先取得每列的圖片網址,再做session抓圖片
        let imageUrl = animalArray?[indexPath.row].ImageName
        if let getUrl = URL(string: imageUrl!){
            let task = URLSession.shared.dataTask(with: getUrl, completionHandler: { (data, response, error) in
                if error != nil{
                    print(error?.localizedDescription)
                }
                
                if let downloadData = data {
                    
                //將data圖片存到陣列裡,以用來傳到下一頁
                self.imageData?.append(downloadData)

                    DispatchQueue.main.async {
                        cell.animalImage.image = UIImage(data: downloadData)
                    }
                }
            })
            task.resume()
        }
        
        return cell
    }

}





