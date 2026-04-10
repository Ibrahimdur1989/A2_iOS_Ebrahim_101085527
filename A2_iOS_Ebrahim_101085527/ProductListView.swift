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

    var body: some View {
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
        .navigationTitle("Product List")
    }
}
