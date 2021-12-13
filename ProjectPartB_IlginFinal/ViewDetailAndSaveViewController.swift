//
//  ViewDetailAndSaveViewController.swift
//  ProjectPartB_IlginFinal
//
//  Created by Ilgin Bedir on 19/11/21.
//

import UIKit
import CoreData
//show Message function to display "data added succesfully" message once the user saves a character
//Ilgin 19.11.2021
func showMessage(value:String, controller : UIViewController)
{
    var alert = UIAlertController(title: "", message: value, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: {
        action
        in
        controller.dismiss(animated: true, completion: nil)
    })
    alert.addAction(action)
    controller.present(alert, animated: true, completion: nil)
}
class ViewDetailAndSaveViewController: UIViewController {
    //Connecting all outlets in the character detail page - Ilgin 19.11.2021
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ancestryTextField: UITextField!
    @IBOutlet weak var patronusTextField: UITextField!
    @IBOutlet weak var houseTextField: UITextField!
    @IBOutlet weak var picView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetching data sent by the searchCharacterViewController to display name, house, ancestry, patronus, and image. - Ilgin 19.11.2021
        nameTextField.text = c.name
        houseTextField.text = c.house
        ancestryTextField.text = c.ancestry
        patronusTextField.text = c.patronus
        picView.image = c.pic
    }
    //This button allows the user to save the character as a HpCharacter, which has been created in CoreData. To clarify once again Character and HpCharacter have the same attributes however, the Character class is temporary to display the fetched API data and HpCharacter is a CoreData class that allows us to store the character information in the system. - Ilgin 19.11.2021
    //Note: Text fields have been disabled so user cannot change them - Ilgin 19.11.2021
    @IBAction func saveButton(_ sender: UIButton) {
        //creating context
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
       //fetching all saved hp characters to see if character has already been saved.
        let request = NSFetchRequest<NSManagedObject>(entityName: "HpCharacter")
        var hpcharacters = [HpCharacter]()
        hpcharacters = try! context.fetch(request) as! [HpCharacter]
        //if character has already been saved message pops up to tell user to save other characters. - Ilgin 20.11.2021
        if hpcharacters.contains(where:{ $0.name == nameTextField.text}){
            showMessage(value: "This character has already been saved. Please add another character", controller: self)
        }
        else{
            //if hp character has not already been saved we create a new hp character  - Ilgin 19.11.2021
            let hp_character = NSEntityDescription.insertNewObject(forEntityName: "HpCharacter", into: context) as! HpCharacter
            //assigning the details we've fetched from the API to the newly created HpCharacter.
            hp_character.name = c.name
            hp_character.patronus = c.house
            hp_character.ancestry = c.ancestry
            hp_character.house = c.patronus
            hp_character.image = picView.image?.pngData()
            //saving the context - Ilgin 19.11.2021
            do{
                try context.save()
                //display message once saved successfully.
                showMessage(value: "Character saved sucessfully, go back to the menu to view your saved characters", controller: self)
            }
            catch{
                //display message if there is error saving data.
                showMessage(value: "Error saving data please try again", controller: self)
            }
        }
        
       
        
    }
    


}
