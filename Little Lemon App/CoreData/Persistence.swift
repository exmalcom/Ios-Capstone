import CoreData
import Foundation

// PersistenceController handles the Core Data stack, which includes the NSPersistentContainer
struct PersistenceController {
    // Shared instance to access the PersistenceController globally
    static let shared = PersistenceController()

    // The persistent container that handles the Core Data stack
    let container: NSPersistentContainer

    // Initializer sets up the NSPersistentContainer with the database name and configures the store
    init() {
        // Initialize the persistent container with the name of the database (ExampleDatabase)
        container = NSPersistentContainer(name: "ExampleDatabase")
        
        // Configure the container to use a dummy path ("/dev/null") for persistent store, effectively disabling persistence
        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        
        // Load persistent stores (the Core Data storage)
        container.loadPersistentStores(completionHandler: { _, _ in })
        
        // Enable automatic merging of changes from parent contexts
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // Function to clear all "Dish" entities from the Core Data store
    func clear() {
        // Create a fetch request to retrieve all "Dish" entities
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Dish")
        
        // Create a batch delete request to delete all fetched "Dish" entities
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        // Execute the delete request, passing the context from the container
        let _ = try? container.persistentStoreCoordinator.execute(deleteRequest, with: container.viewContext)
    }
}
