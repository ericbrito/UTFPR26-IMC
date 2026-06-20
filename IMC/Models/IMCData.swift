//
//  IMCData.swift
//  IMC
//
//  Created by Eric Alves Brito on 20/06/26.
//

import Foundation

struct IMCData: Codable, Identifiable {
    let id: UUID
    let name: String
    let gender: String
    let imc: Double
    
    init(name: String, gender: String, imc: Double) {
        self.id = UUID()
        self.name = name
        self.gender = gender
        self.imc = imc
    }
}
