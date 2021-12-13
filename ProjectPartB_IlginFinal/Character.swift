//
//  Character.swift
//  ProjectPartB_IlginFinal
//
//  Created by Ilgin Bedir on 19/11/21.
//

//This class is to create temporary character objects from the API data to display the details.
//19.11.21
import Foundation
import UIKit
class Character : NSObject, NSCoding{
    var name : String
    var pic: UIImage!
    var house : String
    var patronus : String
    var ancestry : String
    
    func encode(with coder: NSCoder){
        coder.encode(name, forKey: "cName")
        coder.encode(pic, forKey: "img")
        coder.encode(house, forKey: "house")
        coder.encode(patronus, forKey: "patronus")
        coder.encode(ancestry, forKey: "ancestry")
        
    }
    
    required init?(coder: NSCoder) {
        
        self.name = coder.decodeObject(forKey: "cName") as! String
        self.pic = (coder.decodeObject(forKey: "img") as? UIImage)
        self.house = coder.decodeObject(forKey: "house") as! String
        self.patronus = coder.decodeObject(forKey: "patronus") as! String
        self.ancestry = coder.decodeObject(forKey: "ancestry") as! String
        
    }
    
    init(name:String, img:UIImage, house:String, patronus:String, ancestry:String){
        
        self.name = name
        self.pic = img
        self.house = house
        self.ancestry = ancestry
        self.patronus = patronus
    }
}
