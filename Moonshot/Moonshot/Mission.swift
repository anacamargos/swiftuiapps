//
//  Mission.swift
//  Moonshot
//
//  Created by Ana Leticia Camargos on 24/02/22.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
}
