//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ana Leticia Camargos on 15/02/22.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
