//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Ali Dinç on 26/07/2021.
//

import CoreData

extension Entry {
    
    @discardableResult
    convenience init(title: String, bodytext: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.bodytext = bodytext
        self.timestamp = timestamp
    }
}
