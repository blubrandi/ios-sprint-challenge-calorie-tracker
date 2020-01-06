//
//  CalorieCount+CoreDataProperties.swift
//  
//
//  Created by Brandi Bailey on 1/5/20.
//
//

import Foundation
import CoreData


extension CalorieCount {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CalorieCount> {
        return NSFetchRequest<CalorieCount>(entityName: "CalorieCount")
    }

    @NSManaged public var calories: Int64
    @NSManaged public var timeStamp: Date?

}
