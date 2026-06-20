//
//  Gender.swift
//  IMC
//
//  Created by Eric Alves Brito on 20/06/26.
//

enum Gender: String {
    case male = "Male"
    case female = "Female"
    
    var name: String {
        switch self {
        case .male:
            return "Homem"
        case .female:
            return "Mulher"
        }
    }
}
