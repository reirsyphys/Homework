//
//  ContentView.swift
//  Homework
//
//  Created by Aлиярова Арзина Маратовна on 02.01.2024.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: HomeworkDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(HomeworkDocument()))
}
