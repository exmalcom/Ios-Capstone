import CoreData
import Foundation
import SwiftUI

// FetchedObjects is a reusable SwiftUI view component for fetching CoreData objects 
// and rendering a custom view based on the results of the fetch.
struct FetchedObjects<T, Content>: View where T : NSManagedObject, Content : View {
    
    // A closure that takes an array of fetched objects and returns a view.
    let content: ([T]) -> Content
    
    // A FetchRequest is used to fetch objects of type T from CoreData.
    var request: FetchRequest<T>
    
    // FetchedResults gives access to the fetched objects.
    var results: FetchedResults<T> { request.wrappedValue }
    
    // Custom initializer to configure the fetch request with a predicate and sort descriptors.
    init(
        predicate: NSPredicate = NSPredicate(value: true), // Default predicate fetches all objects
        sortDescriptors: [NSSortDescriptor] = [], // Optional sorting of results
        @ViewBuilder content: @escaping ([T]) -> Content // Closure that takes fetched objects and returns a view
    ) {
        self.content = content
        self.request = FetchRequest(
            entity: T.entity(), // Entity type for CoreData fetch
            sortDescriptors: sortDescriptors, // Optional sorting
            predicate: predicate // Optional filtering with predicate
        )
    }
    
    // Body of the view, which passes the fetched results to the content closure.
    var body: some View {
        self.content(results.map { $0 }) // Map results into an array and pass to content closure
    }
}
