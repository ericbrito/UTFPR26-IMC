//
//  ResultView.swift
//  IMC
//
//  Created by Eric Alves Brito on 20/06/26.
//

import SwiftUI

struct ResultView: View {
    let userName: String
    let gender: Gender
    let imc: Double
    @Binding var navigationPath: NavigationPath
    
    private let imcStorage = IMCStorage()

    var result: String {
        switch imc {
        case 0..<16: "Magreza"
        case 16..<18.5: "Abaixo do peso"
        case 18.5..<25: "Peso ideal"
        case 25..<30: "Sobrepeso"
        default: "Obesidade"
        }
    }
    
    var imageNumber: Int {
        switch imc {
        case 0..<16: 1
        case 16..<18.5: 2
        case 18.5..<25: 3
        case 25..<30: 4
        default: 5
        }
    }
    
    var body: some View {
        VStack(spacing: 30) {
            if !userName.isEmpty {
                name
            }
            image
            VStack {
                finalResult
                finalIMC
            }
            
            HStack {
                addToListButton
                listButton
            }
            
            resetButton
        }
    }
    
    var name: some View {
        Text("Olá \(userName)!")
    }
    
    var image: some View {
        Image("\(gender.rawValue)\(imageNumber)")
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 360)
    }
    
    var finalResult: some View {
        HStack {
            Text("O resultado do IMC é:")
            
            Text(String(format: "%.2f", imc))
                .bold()
        }
        .font(.title2)
    }
    
    var finalIMC: some View {
        Text(result)
            .font(.system(size: 50, weight: .bold, design: .rounded))
            .foregroundStyle(Color.accentColor)
    }
    
    var resetButton: some View {
        AppButton(text: "Recalcular IMC") {
            navigationPath = NavigationPath()
        }
    }
    
    var listButton: some View {
        Button {
            navigationPath.append(AppRoute.list)
        } label: {
            HStack {
                Image(systemName: "list.bullet")
                Text("Listagem")
            }
            .font(.title3)
            .fontWeight(.semibold)
            .fontDesign(.rounded)
            .frame(maxWidth: .infinity, minHeight: 40)
        }
        .buttonStyle(.bordered)
        .padding(.horizontal)
    }
    
    var addToListButton: some View {
        AppButton(text: "Adicionar") {
            let imcData = IMCData(
                name: userName,
                gender: gender.name,
                imc: imc
            )
            imcStorage.items.append(imcData)
        }
        .disabled(userName.isEmpty)
    }
}

#Preview {
    ResultView(
        userName: "Adriano",
        gender: .female,
        imc: 90,
        navigationPath: .constant(NavigationPath())
    )
}
