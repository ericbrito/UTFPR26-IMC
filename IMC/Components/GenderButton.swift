//
//  GenderButton.swift
//  IMC
//
//  Created by Eric Alves Brito on 20/06/26.
//

import SwiftUI

struct GenderButton: View {
    let gender: Gender
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(gender.name)
                .font(.title3)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
        }
        .opacity(isSelected ? 1 : 0.4)
    }
}

#Preview {
    VStack {
        GenderButton(gender: .male, isSelected: true) {}
        GenderButton(gender: .female, isSelected: false) {}
    }
}
