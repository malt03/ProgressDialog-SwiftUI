//
//  ProgressView.swift
//  ProgressDialog
//
//  Created by Koji Murata on 2019/09/19.
//  Copyright © 2019 Koji Murata. All rights reserved.
//

import SwiftUI

struct ProgressView: View {
    var progress: Double
    
    var body: some View {
        Color.clear.modifier(Modifier(progress: progress))
    }
    
    struct Modifier: AnimatableModifier {
        var progress: Double
        var animatableData: Double {
            get { progress }
            set { progress = newValue }
        }
        
        func body(content: Content) -> some View {
            return content
                .overlay(Arg(start: 360, end: 0).foregroundColor(Color(custom: "ProgressPlaceholder")))
                .overlay(Arg(start: progress * 360, end: 0).foregroundColor(Color(custom: "Progress")))
        }
    }
}
