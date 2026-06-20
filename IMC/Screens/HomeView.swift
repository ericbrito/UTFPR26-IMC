//
//  HomeView.swift
//  IMC
//
//  Created by Eric Alves Brito on 20/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var userName: String = ""
    @State private var selectedGender: Gender = .male
    @State private var height: Int = 180
    @State private var weight: Int = 70
    
    let showResult: (String, Gender, Double) -> Void
    
    var body: some View {
        VStack(spacing: 22) {
            title
            nameField
            mainImage
            genderSelectionButton
            measureViews
            calculateIMCButton
            Spacer()
        }
        .background(Color.accentColor.opacity(0.2))
    }
    
    // MARK: - Title
    var title: some View {
        Text("Calculadora de IMC")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .fontDesign(.rounded)
    }
    
    // MARK: - Name Field
    var nameField: some View {
        HStack {
            Image(systemName: "person.fill")
            TextField("Digite seu nome", text: $userName)
                .textFieldStyle(.plain)
                .font(.title3)
        }
        .padding(12)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .shadow(color: Color(white: 0.8), radius: 8)
        .padding(.horizontal)
    }
    
    // MARK: - Main Image
    var mainImage: some View {
        Image("\(selectedGender.rawValue)3")
            .resizable()
            .scaledToFit()
            .frame(width: 180, height: 260)
    }
    
    // MARK: - Gender Selection Buttons
    var genderSelectionButton: some View {
        HStack(spacing: 60) {
            GenderButton(
                gender: .male,
                isSelected: selectedGender == .male
            ) {
                selectedGender = .male
            }
            GenderButton(
                gender: .female,
                isSelected: selectedGender == .female
            ) {
                selectedGender = .female
            }
        }
    }
    
    // MARK: - Measure Views
    var measureViews: some View {
        VStack {
            MeasureView(image: "pencil.and.ruler", text: "Altura (cm)", value: $height)
            MeasureView(image: "scalemass.fill", text: "Peso (kg)", value: $weight)
        }
        .padding()
    }
    
    // MARK: - Calculate IMC Button
    var calculateIMCButton: some View {
        AppButton(text: "Calcular IMC") {
            let imc = Double(weight) / (Double(height*height) / 10000)
            showResult(userName, selectedGender, imc)
        }
    }
}

#Preview {
    HomeView{_,_,_ in }
}
