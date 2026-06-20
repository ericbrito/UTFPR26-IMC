//
//  ContentView.swift
//  IMC
//
//  Created by Eric Alves Brito on 20/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            HomeView { userName, gender, imc in
                navigationPath.append(
                    AppRoute.result(
                        userName: userName,
                        gender: gender,
                        imc: imc
                    )
                )
            }
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .result(let username, let gender, let imc):
                        ResultView(
                            userName: username,
                            gender: gender,
                            imc: imc,
                            navigationPath: $navigationPath
                        )
                    case .list:
                        ListView()
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
