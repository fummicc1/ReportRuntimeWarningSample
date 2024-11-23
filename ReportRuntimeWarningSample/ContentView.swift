//
//  ContentView.swift
//  ReportRuntimeWarningSample
//
//  Created by Fumiya Tanaka on 2024/11/23.
//

import SwiftUI
import os

let runtimeWarning = RuntimeWarning()

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await runtimeWarning.log(
                message: "RuntimeWarningが表示されました。"
            )
        }
    }
}

#Preview {
    ContentView()
}
