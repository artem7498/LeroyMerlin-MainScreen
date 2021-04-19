//
//  MSectionColeection.swift
//  LeroyMerlin MainScreen
//
//  Created by Артём on 4/19/21.
//

import Foundation

struct MSectionCollection: Decodable, Hashable {
    let type: String
    let title: String
    let items: [MSection]

//    let identifier = UUID()
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(identifier)
//    }
}
