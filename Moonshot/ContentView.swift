//
//  ContentView.swift
//  Moonshot
//
//  Created by Masoud Safari on 2024-03-01.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text(String(astronauts.count)) // for test
    }
}

#Preview {
    ContentView()
}
