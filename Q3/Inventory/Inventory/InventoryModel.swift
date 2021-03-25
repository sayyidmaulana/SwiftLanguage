//
//  InventoryModel.swift
//  Inventory
//
//  Created by Sayyid Maulana Khakul Yakin on 24/03/21.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let inventory = try? newJSONDecoder().decode(Inventory.self, from: jsonData)

import Foundation

// MARK: - InventoryElement
struct InventoryElement: Codable {
    let inventoryID: Int
    let name, type: String
    let tags: [String]
    let purchasedAt: Int
    let placement: Placement

    enum CodingKeys: String, CodingKey {
        case inventoryID = "inventory_id"
        case name, type, tags
        case purchasedAt = "purchased_at"
        case placement
    }
}

// MARK: - Placement
struct Placement: Codable {
    let roomID: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case roomID = "room_id"
        case name
    }
}

typealias Inventory = [InventoryElement] 
