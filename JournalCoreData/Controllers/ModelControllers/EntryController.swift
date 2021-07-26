//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Ali Dinç on 26/07/2021.
//

import CoreData


class EntryController {
    
    static let shared = EntryController()
    
    var entries = [Entry]()
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() { }
    
    // MARK: - CRUD Functions
    
    func createEntry(title: String, body: String) {
        let newEntry = Entry(title: title, bodytext: body)
        entries.append(newEntry)
        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        self.entries = entries
    }
    
    func updateEntries(entry: Entry, title: String, body: String) {
        entry.title = title
        entry.bodytext = body
    }

    func deleteEntries(entry: Entry) {
        guard let index = entries.firstIndex(of: entry) else { return }
        entries.remove(at: index)
        CoreDataStack.context.delete(entry)
        CoreDataStack.saveContext()
    }
}
