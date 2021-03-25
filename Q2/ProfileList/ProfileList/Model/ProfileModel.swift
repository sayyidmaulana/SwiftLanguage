//
//  ProfileModel.swift
//  ProfileList
//
//  Created by Sayyid Maulana Khakul Yakin on 24/03/21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let profile = try? newJSONDecoder().decode(Profile.self, from: jsonData)

import Foundation

// MARK: - ProfileElement
struct ProfileElement: Codable {
    let id: Int
    let username: String
    let profile: ProfileClass
    let articles: [Articles]

    enum CodingKeys: String, CodingKey {
        case id, username, profile
        case articles = "articles:"
    }
}

// MARK: - Articles
struct Articles: Codable {
    let id: Int
    let title, publishedAt: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case publishedAt = "published_at"
    }
}

// MARK: - ProfileClass
struct ProfileClass: Codable {
    let fullName, birthday: String
    let phones: [String]

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case birthday, phones
    }
}

typealias Profile = [ProfileElement]
