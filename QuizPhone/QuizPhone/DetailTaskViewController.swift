//
//  DetailTaskViewController.swift
//  QuizPhone
//
//  Created by Rizki Syaputra on 10/25/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit

class DetailTaskViewController: UIViewController {
    @IBOutlet weak var etBrand: UITextField!
    @IBOutlet weak var etModel: UITextField!
    @IBOutlet weak var etPhoneName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnSave(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let nameDevice = DataIphone(context: context)
        nameDevice.phone_name = etPhoneName.text
        
        nameDevice.model = etModel.text
        
        nameDevice.brand = etBrand.text
    
        
        if etPhoneName.text == "" {
            let alert = UIAlertController(title: "Attention", message: "Name can not be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got It", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if etModel.text == ""{
            let alert = UIAlertController(title: "Attention", message: "Model can not be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got It", style: .default, handler: nil))
        }else if etBrand.text == ""{
            let alert = UIAlertController(title: "Attention", message: "Brand can not be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got It", style: .default, handler: nil))
        }else{
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
    _  = navigationController?.popViewController(animated: true)
    
    //mencetak kalau data berhasil ditambahkan
    print("Data berhasil disimpan")
    }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
