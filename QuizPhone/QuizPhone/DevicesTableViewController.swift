//
//  DevicesTableViewController.swift
//  QuizPhone
//
//  Created by Rizki Syaputra on 10/25/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit

class DevicesTableViewController: UITableViewController {
    var Device: [DataIphone] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Device.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDevice", for: indexPath) as! NoteeTableViewCell
        
        // Configure the cell...
        
        let dataDevice = Device[indexPath.row]
        
        if let myDataTask = dataDevice.phone_name {
            cell.labelNamePhone.text =  myDataTask
        }
        if let myDataTask2 = dataDevice.model {
            cell.labelModel.text =  myDataTask2
        }
        if let myDataTask3 = dataDevice.brand {
            cell.labelBrand.text =  myDataTask3
        }
        
        return cell
    }
    
    
    override func  viewWillAppear(_ animated: Bool) {
        getData()
        
        tableView.reloadData()
    }
    
    func getData() {
        do {
            Device = try context.fetch(DataIphone.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let device = Device[indexPath.row]
            context.delete(device)
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                Device = try context.fetch(DataIphone.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
        }
        //load data lagi
        tableView.reloadData()
    }
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
