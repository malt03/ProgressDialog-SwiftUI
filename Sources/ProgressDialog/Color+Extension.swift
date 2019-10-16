//
//  Color+Extension.swift
//  ProgressDialog
//
//  Created by Koji Murata on 2019/09/19.
//  Copyright © 2019 Koji Murata. All rights reserved.
//

import SwiftUI

extension Color {
    static func background(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .dark:  return Color(white: 1, opacity: 0.5)
        case .light: return Color(white: 0, opacity: 0.5)
        @unknown default: fatalError()
        }
    }

    static func dialogBackground(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .dark:  return .black
        case .light: return .white
        @unknown default: fatalError()
        }
    }

    static func progress(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .dark:  return Color(white: 1, opacity: 0.8)
        case .light: return Color(white: 0, opacity: 0.8)
        @unknown default: fatalError()
        }
    }

    static func progressPlaceholder(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .dark:  return Color(white: 1, opacity: 0.1)
        case .light: return Color(white: 0, opacity: 0.1)
        @unknown default: fatalError()
        }
    }
}
