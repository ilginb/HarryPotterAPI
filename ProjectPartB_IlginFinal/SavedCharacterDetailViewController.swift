//
//  SavedCharacterDetailViewController.swift
//  ProjectPartB_IlginFinal
//
//  Created by Ilgin Bedir on 19/11/21.
//

import UIKit

class SavedCharacterDetailViewController: UIViewController {
//connection outlets to display saved harry potter characters
    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var ancestryTextField: UITextField!
    @IBOutlet weak var patronusTextField: UITextField!
    @IBOutlet weak var houseTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //loading hp character details into text fields. text fields have been disabled - Ilgin 19.11.2021
        nameTextField.text = hp.name
        houseTextField.text = hp.house
        ancestryTextField.text = hp.ancestry
        patronusTextField.text = hp.patronus
        picView.image = UIImage(data: hp.image!)
        
       
    }
    


}
