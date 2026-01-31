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
            List {
                ForEach(viewModel.names, id: \.self) { name in
                    Text(name)
                }
                .onDelete { indexSet in
                    viewModel.deleteName(at: indexSet)
                }
                .onMove { source, destination in
                    viewModel.moveName(from: source, to: destination)
                }
            }
            .onAppear() {
                viewModel.loadNames()
            }
            .navigationTitle("Random name dropper")
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
