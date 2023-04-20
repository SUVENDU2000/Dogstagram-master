//
//  ViewController.swift
//  DogStagram(CollectionViewInTableViewCell)
//
//  Created by Suvendu Kumar on 17/01/2023
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var table:UITableView!
    var models = [Model]()
    override func viewDidLoad() {
        super.viewDidLoad()
        models.append(Model(text:"Bulldog" ,imageName: "Bulldog"))
       // models.append(Model(text:"German" ,imageName: "German"))
        models.append(Model(text:"Husky" ,imageName: "Husky"))
        models.append(Model(text:"Labrador" ,imageName: "Labrador"))
        models.append(Model(text:"Pomerian",imageName: "Pomerian"))
        models.append(Model(text:"Pug" ,imageName: "Pug"))
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }

    //Table:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count - 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: models)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}
struct Model{
    let text:String
    let imageName:String
    init(text:String,imageName:String) {
        self.text = text
        self.imageName = imageName
    }
}
