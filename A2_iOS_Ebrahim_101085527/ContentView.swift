//
//  ContentView.swift
//  A2_iOS_Ebrahim_101085527
//
//  Created by Ebrahim Al-Serri on 2026-04-09.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.productName, ascending: true)],
        animation: .default)
    private var products: FetchedResults<Product>

    var body: some View {
        NavigationView {
            List {
                ForEach(products) { product in
                    VStack(alignment: .leading) {
                        Text(product.productName ?? "")
                            .font(.headline)
                        
                        Text(product.productDescription ?? "")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Products")
            .onAppear {
                insertSampleProducts()
            }
        }
    }

    private func insertSampleProducts() {
        if products.count > 0 {
            return
        }
        
        addProduct(id: "P001", name: "iPhone 15", description: "Apple smartphone", price: 1299.99, provider: "Apple")
        addProduct(id: "P002", name: "Galaxy S24", description: "Samsung smartphone", price: 1199.99, provider: "Samsung")
        addProduct(id: "P003", name: "iPad Air", description: "Apple tablet device", price: 899.99, provider: "Apple")
        addProduct(id: "P004", name: "MacBook Air", description: "Lightweight Apple laptop", price: 1499.99, provider: "Apple")
        addProduct(id: "P005", name: "Dell XPS 13", description: "Compact Windows laptop", price: 1399.99, provider: "Dell")
        addProduct(id: "P006", name: "Sony Headphones", description: "Wireless noise cancelling headphones", price: 399.99, provider: "Sony")
        addProduct(id: "P007", name: "Apple Watch", description: "Smart watch for fitness and notifications", price: 599.99, provider: "Apple")
        addProduct(id: "P008", name: "Canon Camera", description: "Digital camera for photography", price: 1099.99, provider: "Canon")
        addProduct(id: "P009", name: "HP Printer", description: "Wireless home office printer", price: 249.99, provider: "HP")
        addProduct(id: "P010", name: "Logitech Mouse", description: "Wireless ergonomic mouse", price: 79.99, provider: "Logitech")
        
        do {
            try viewContext.save()
        } catch {
            print("Error saving sample products: \(error)")
        }
    }

    private func addProduct(id: String, name: String, description: String, price: Double, provider: String) {
        let newProduct = Product(context: viewContext)
        newProduct.productId = id
        newProduct.productName = name
        newProduct.productDescription = description
        newProduct.productPrice = price
        newProduct.productProvider = provider
    }
}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
