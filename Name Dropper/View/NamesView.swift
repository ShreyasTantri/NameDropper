//
//  NamesView.swift
//  Name Dropper
//
//  Created by CCS038 on 30/01/26.
//

import SwiftUI

struct NamesView: View {
    @State var viewModel: NamesViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.names, id: \.self) { name in
                Text(name)
            }
            .onAppear() {
                viewModel.loadNames()
            }
            .navigationTitle("Add names")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.addRandomName()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
    }
}

#Preview {
    NamesView(viewModel: NamesViewModel())
}
