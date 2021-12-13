//
//  SearchCharacterViewController.swift
//  ProjectPartB_IlginFinal
//
//  Created by Ilgin Bedir on 19/11/21.
//

import UIKit
//empty list for character retrieved from API - Ilgin 19.11.2021
var fetchedCharacters = [Character]()
var c : Character!
class SearchCharacterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    //list of characters to filter for search bar - Ilgin 19.11.2021
    var filteredCharacters : [Character]!
    
    //setting rows to the count of the filteredCharacters list - Ilgin 19.11.2021
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //setting the cells to data from the API. name, house and image. - Ilgin 19.11.2021
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CharacterTableViewCell
        cell.nameLabel.text = filteredCharacters[indexPath.row].name
        cell.picView.image = filteredCharacters[indexPath.row].pic
        cell.houseLabel.text = filteredCharacters[indexPath.row].house
        return cell
    }
    //This function directs the user to the details page, so that they can save the character. - Ilgin 19.11.2021
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        c = filteredCharacters[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: self)
    }
//connecting search bar and tableview - Ilgin 19.11.2021
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var characterTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        characterTableView.dataSource = self
        searchBar.delegate = self
        //calling parseData to fetch characters from API - Ilgin 17.11.2021
        parseData()
        filteredCharacters = fetchedCharacters
        
    }
    
    
    func parseData(){
        //making sure the list is empty - Ilgin 17.11.2021
        fetchedCharacters = []
        //url for API - Ilgin 17.11.2021
        let harryPotterString = "https://hp-api.herokuapp.com/api/characters"
        let harryPotterURL = URL(string: harryPotterString)
        let request = URLRequest(url: harryPotterURL!)
        let task = URLSession.shared.dataTask(with: request){
            (data,response,error)
            in
            if(error == nil){
                //fetching objects as an NSArray - Ilgin 17.11.2021
                let json = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSArray
                for eachFetchedCharacter in json {
                    //retrieving name, house, patronus, ancestry, picURL - Ilgin  17.11.2021
                                let eachCharacter = eachFetchedCharacter as! [String : Any]
                                let name = eachCharacter["name"] as! String
                                let house = eachCharacter["house"] as! String
                                let patronus = eachCharacter["patronus"] as! String
                                let ancestry = eachCharacter["ancestry"] as! String
                                let picURL = eachCharacter["image"] as! String
                                var image : UIImage!
                                //pulling the image data -Ilgin  17.11.2021
                                let purl = URL(string: picURL)
                                    if purl != nil{
                                        let picData = try! Data(contentsOf: purl!)
                                        image = UIImage(data: picData)
                                    }
                                    else{
                                        image = UIImage(systemName: "questionmark")
                                    }
                                
                    //Character is a sepearate model than HpCharacter. Character doesn't store any of the information, it just creates a temporary object of the data fetched from the API to make it easier to display the details.
                    //So, we create a character from the fetched data and add it to the list below - Ilgin  17.11.2021
                    fetchedCharacters.append(Character(name: name, img: image!, house:house, patronus:patronus, ancestry:ancestry))
                }
                //Loads data into table - Ilgin  17.11.2021
                DispatchQueue.main.async {
                    self.characterTableView.reloadData()
                }
            }
            else{
               showMessage(value: "Error fetching data", controller: self)
            }
        }
        task.resume()
    }
    //Function for searchBar - Ilgin 19.11.2021
    //no input validation has been applied because it is a search bar instead of a text field. The user simply has to start typing to display characters. - Ilgin 19.11.2021
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        //when user enters text into the search box, filter goes through the items in the list. Returns true if the item is included. returns false if item shouldn't be included.
        //I've added functionality so that user can search by name and house
        //Ilgin - 19.11.2021
        filteredCharacters = fetchedCharacters.filter({ (character:Character) -> Bool in
            let name = character.name.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            let house = character.house.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return name != nil || house != nil})
       //automatically refreshes table contents based on search - Ilgin 19.11.21
        characterTableView.reloadData()
    }

}
