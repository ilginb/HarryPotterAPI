//
//  SavedCharacterTableViewController.swift
//  ProjectPartB_IlginFinal
//
//  Created by Ilgin Bedir on 19/11/21.
//

import UIKit
import CoreData
var hp : HpCharacter!
class SavedCharacterTableViewController: UITableViewController {
    var hpcharacters = [HpCharacter]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetching list of saved harry potter characters - Ilgin 19.11.2021
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSManagedObject>(entityName: "HpCharacter")
        hpcharacters = try! context.fetch(request) as! [HpCharacter]
        
    }

    

// setting number of rows to number of items in hp character list - Ilgin 19.11.2021
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hpcharacters.count
    }

    //Setting cell contents to hp character details.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hpCell", for: indexPath) as! HpTableViewCell
        cell.nameTextField.text = hpcharacters[indexPath.row].name
        let picData = hpcharacters[indexPath.row].image
        cell.picView?.image = UIImage(data: picData!)
      
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //when clicked on a row, it directs the user to a new window where they can see the Harry Potter character details - 19.11.2021
        hp = hpcharacters[indexPath.row]
        performSegue(withIdentifier: "characterDetails", sender: self)
    }

 

}
