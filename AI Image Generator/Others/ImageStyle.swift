//
//  ImageStyle.swift
//  AI Image Generator
//
//  Created by Anubhav Tomar on 08/12/24.
//

import Foundation

enum ImageStyle: String, CaseIterable {
    case surrealism
    case realism
    case threeDRender
    case abstract
    case minimalism
    case retro
    case geometric
    
    var title: String {
        switch self {
        case .surrealism:
            return "Surrealism"
        case .realism:
            return "Realism"
        case .threeDRender:
            return "3D Render"
        case .abstract:
            return "Abstract"
        case .minimalism:
            return "Minimalism"
        case .retro:
            return "Retro"
        case .geometric:
            return "Geometric"
        }
    }
}
