//
//  DetailTableViewController.swift
//  finalAnimalJson
//
//  Created by 黃毓皓 on 2017/3/9.
//  Copyright © 2017年 ice elson. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var myArrayInfo:animal?
    var imageArray:[Data]? = []
    var nowIndex:Int?
    
    @IBOutlet weak var myInfo: UITextView!
    @IBOutlet weak var myAdress: UILabel!
    @IBOutlet weak var myPhone: UILabel!
    @IBOutlet weak var myAge: UILabel!
    @IBOutlet weak var mySex: UILabel!
    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var showImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if myArrayInfo?.Name != "" {
            myName.text = myArrayInfo?.Name
        }else {
            myName.text = "待取名"
        }

        showImage.image = UIImage(data: (imageArray?[nowIndex!])!)
       
        
        myInfo.text = myArrayInfo?.Note
        myAdress.text = myArrayInfo?.Resettlement
        myPhone.text = myArrayInfo?.Phone
        myAge.text = myArrayInfo?.Age
        mySex.text = myArrayInfo?.Sex
        
        
        
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
