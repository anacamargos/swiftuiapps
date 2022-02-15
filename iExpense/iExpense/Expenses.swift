//
//  Expenses.swift
//  iExpense
//
//  Created by Ana Leticia Camargos on 15/02/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
