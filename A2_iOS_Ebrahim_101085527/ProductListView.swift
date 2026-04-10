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
            NSSortDescriptor(key: "productId", ascending: true)
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
                VStack(alignment: .leading, spacing: 5) {
                    Text(product.productName ?? "")
                        .font(.title3)

                    Text(product.productDescription ?? "")
                        .font(.subheadline)
                }
                .padding(5)
            }
        }
        .navigationTitle("Product List")
        .font(.title2)
        .searchable(text: $searchText, prompt: "Search by name or description")
    }
}
