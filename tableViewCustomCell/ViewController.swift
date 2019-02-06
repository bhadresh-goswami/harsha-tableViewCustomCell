//
//  ViewController.swift
//  tableViewCustomCell
//
//  Created by Mac on 06/02/19.
//  Copyright © 2019 bhadresh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var data = [InfoModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = [
            InfoModel(name: "Anand", course: "iOS", cellImage: "img_1.png"),
            InfoModel(name: "Ankita", course: "Android", cellImage: "img_4.png"),
            InfoModel(name: "Rushabh", course: "iOS", cellImage: "img_1.png"),
            InfoModel(name: "Ramlal", course: "iOS", cellImage: "img_2.png"),
            InfoModel(name: "Karanlal", course: "iOS", cellImage: "img_3.png")
        ]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//tableview methods

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoTableViewCell
        let info = data[indexPath.section]
        
        cell.cellImage.image = UIImage(named: info.cellImage)
        cell.lblName.text = "\(info.name)"
        cell.lblCourse.text = "\(info.course)"
        cell.btnDetails.addTarget(self, action: #selector(self.TapToViewDetails(_:)), for: .touchUpInside)
        //cell.btnDetails.indexCurrentPath = indexPath
        cell.btnDetails.index_Path(forButton: cell.btnDetails, indexPath: indexPath)
        
        return cell
        
        
    }
    
    @objc func TapToViewDetails(_ sender:UIButton)  {
        
        
        print(data[sender.index_Path(fromButton: sender).section])
        
    }
    
    
}
struct CurrentIndexPath {
   static var indexPath : IndexPath?
}

protocol ManageIndexPathInButton {
    func index_Path(forButton sender:UIButton,  indexPath:IndexPath)
    func index_Path(fromButton sender:UIButton)->IndexPath
}

extension UIButton:ManageIndexPathInButton{
  
    
    private(set) var indexCurrentPath: IndexPath {
        get {
            
            let i = IndexPath(row: -1, section: -1)
            
           guard let val =
            objc_getAssociatedObject(self, &CurrentIndexPath.indexPath) as? IndexPath else{
                return i
            }
            return val
        }
        set(newValue) {
            objc_setAssociatedObject(self, &CurrentIndexPath.indexPath, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        }
    }
    
    
    
    func index_Path(forButton sender: UIButton, indexPath: IndexPath) {
        indexCurrentPath = indexPath
    }
    
    func index_Path(fromButton sender: UIButton) -> IndexPath {
        return self.indexCurrentPath
    }
    
    
    
}

