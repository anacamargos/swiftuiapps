//
//  ContentView.swift
//  Edutainment
//
//  Created by Ana Leticia Camargos on 08/02/22.
//

import SwiftUI

struct ContentView: View {
    
    let questionCount = [5, 10, 20]
    @State private var selectedTables: Set<Int> = Set([2,3,4])
    @State private var selectedCount = 5
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Edutaiment")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                Text("A Quiz App for Multiplication Table Practicing")
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                Text("🔢 Select the multiplication tables")
                    .font(.body.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                GridStack(itemStart: 2, itemEnd: 13) { item in
                    NumberButton(number: item, preActive: selectedTables.contains(item)) {
                        if(selectedTables.contains(item)) {
                            selectedTables.remove(item)
                        } else {
                            selectedTables.insert(item)
                        }
                    }
                }
                
                Text("🎲 Select how many questions")
                    .font(.body.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                Picker("Select how many questions", selection: $selectedCount) {
                    ForEach(questionCount, id: \.self) { count in
                        Text("\(count)")
                    }
                }
                .pickerStyle(.segmented)
                
                Spacer()
                
                Button {
                // startGame()
                } label: {
                    Text("Let's Go!")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .font(.body.bold())
                .padding(.bottom)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NumberButton: View {
    let number: Int
    var clickEvent: () -> Void
    @State private var active: Bool
    
    init(number: Int, preActive: Bool, clickEvent: @escaping () -> Void) {
        self.number = number
        self.clickEvent = clickEvent
        self.active = preActive
    }
    
    var body: some View {
        Button(action: {
            withAnimation {
                active.toggle()
                clickEvent()
            }
        }) {
            Label {
                Text(number.formatted())
            } icon: {
                if active {
                    Image(systemName: "checkmark")
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(6)
        .background(active ? Color.primary : Color("gray"))
        .foregroundColor(active ? Color("gray") : Color.primary)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

struct GridStack<Content: View>: View {
    let itemStart: Int
    let itemEnd: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        VStack {
            HStack {
                ForEach(itemStart..<6, id: \.self) { item in
                    content(item)
                }
            }
            
            HStack {
                ForEach(6..<10, id: \.self) { item in
                    content(item)
                }
            }
            
            HStack {
                ForEach(10..<itemEnd, id: \.self) { item in
                    content(item)
                }
            }
        }
    }
}
