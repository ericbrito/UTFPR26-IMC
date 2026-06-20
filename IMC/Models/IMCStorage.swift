//
//  IMCStorage.swift
//  IMC
//
//  Created by Eric Alves Brito on 20/06/26.
//

import Foundation
import SwiftUI

class IMCStorage {
    @AppStorage("lista_imc") private var imcList: Data = Data()
    
    var items: [IMCData] {
        get {
            return (try? JSONDecoder().decode([IMCData].self, from: imcList)) ?? []
        }
        set {
//            do {
//                imcList = try JSONEncoder().encode(newValue)
//            } catch {
//                
//            }
            imcList = (try? JSONEncoder().encode(newValue)) ?? Data()
        }
    }
}

