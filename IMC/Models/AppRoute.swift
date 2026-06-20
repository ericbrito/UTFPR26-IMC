//
//  AppRoute.swift
//  IMC
//
//  Created by Eric Alves Brito on 20/06/26.
//

enum AppRoute: Hashable {
    case result(userName: String, gender: Gender, imc: Double)
    case list
}
