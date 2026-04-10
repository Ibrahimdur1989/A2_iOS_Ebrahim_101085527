//
//  AddProductView.swift
//  A2_iOS_Ebrahim_101085527
//
//  Created by Ebrahim Al-Serri on 2026-04-09.
//

import SwiftUI
import CoreData

struct AddProductView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var productId = ""
    @State private var productName = ""
    @State private var productDescription = ""
    @State private var productPrice = ""
    @State private var productProvider = ""

    var body: some View {
        Form {
            Section("Product Information") {
                TextField("Product ID", text: $productId)
                TextField("Product Name", text: $productName)
                TextField("Product Description", text: $productDescription)
                TextField("Product Price", text: $productPrice)
                TextField("Product Provider", text: $productProvider)
            }

            Button("Save Product") {
                saveProduct()
            }
        }
        .navigationTitle("Add Product")
    }

    private func saveProduct() {
        let newProduct = Product(context: viewContext)
        newProduct.productId = productId
        newProduct.productName = productName
        newProduct.productDescription = productDescription
        newProduct.productPrice = Double(productPrice) ?? 0.0
        newProduct.productProvider = productProvider

        do {
            try viewContext.save()
            dismiss()
        } catch {
            print("Error saving product: \(error)")
        }
    }
}
