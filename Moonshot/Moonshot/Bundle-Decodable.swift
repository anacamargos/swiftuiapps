//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Ana Leticia Camargos on 24/02/22.
//

import Foundation

extension Bundle {
    
    func decode(_ file: String) -> [String: Astronaut] {
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle.")
        }
        guard let loaded = try? JSONDecoder().decode([String: Astronaut].self, from: data) else {
            fatalError("Failed to decode \(file) in bundle.")
        }
        return loaded
    }
}