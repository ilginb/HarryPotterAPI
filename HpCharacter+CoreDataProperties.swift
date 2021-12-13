//
//  HpCharacter+CoreDataProperties.swift
//  ProjectPartB_IlginFinal
//
//  Created by Ilgin Bedir on 19/11/21.
//
//

import Foundation
import CoreData


extension HpCharacter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HpCharacter> {
        return NSFetchRequest<HpCharacter>(entityName: "HpCharacter")
    }

    @NSManaged public var name: String?
    @NSManaged public var patronus: String?
    @NSManaged public var ancestry: String?
    @NSManaged public var house: String?
    @NSManaged public var image: Data?

}

extension HpCharacter : Identifiable {

}
