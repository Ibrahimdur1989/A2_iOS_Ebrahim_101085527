//
//  ProductListView.swift
//  A2_iOS_Ebrahim_101085527
//
//  Created by Ebrahim Al-Serri on 2026-04-09.
//


import SwiftUI
import CoreData

struct ProductListView: View {
    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: [
            NSSortDescriptor(key: "productName", ascending: true)
        ],
        animation: .default)
    private var products: FetchedResults<Product>

    @State private var searchText = ""

    var filteredProducts: [Product] {
        guard !searchText.isEmpty else { return Array(products) }
        let search = searchText.lowercased()
        return products.filter { product in
            let name = product.productName?.lowercased() ?? ""
            let description = product.productDescription?.lowercased() ?? ""
            return name.contains(search) || description.contains(search)
        }
    }

    var body: some View {
        List {
            ForEach(filteredProducts) { product in
                VStack(alignment: .leading) {
                    Text(product.productName ?? "")
                        .font(.headline)

                    Text(product.productDescription ?? "")
                        .font(.subheadline)
                }
            }
        }
        .navigationTitle("Product List")
        .searchable(text: $searchText, prompt: "Search by name or description")
    }
}
