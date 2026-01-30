//
//  ContentView.swift
//  Name Dropper
//
//  Created by CCS038 on 30/01/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NamesView(viewModel: NamesViewModel())
    }
}

#Preview {
    ContentView()
}
