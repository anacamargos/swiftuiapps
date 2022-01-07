//
//  iDineApp.swift
//  iDine
//
//  Created by Ana Leticia Camargos on 24/10/21.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
