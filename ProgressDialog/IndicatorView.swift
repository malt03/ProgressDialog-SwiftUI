//
//  IndicatorView.swift
//  ProgressDialog
//
//  Created by Koji Murata on 2019/09/19.
//  Copyright © 2019 Koji Murata. All rights reserved.
//

import SwiftUI

struct IndicatorView: View {
    @State private var animatableData: Double = 0
    var body: some View {
        Color.clear
            .modifier(Modifier(animatableData: animatableData))
            .onAppear {
                withAnimation(Animation.linear(duration: 4).repeatForever(autoreverses: false)) {
                    self.animatableData = 1
                }
            }
    }
    
    struct Modifier: AnimatableModifier {
        var animatableData: Double
        
        func body(content: Content) -> some View {
            let start: Double
            let end: Double
            if animatableData <= 0.5 {
                start = animatableData * 360 * 4
                end = animatableData * 360 * 2
            } else {
                start = (animatableData - 0.5) * 360 * 2
                end = (animatableData - 0.5) * 360 * 4
            }
            return content.overlay(
                Arg(start: start, end: end)
                    .foregroundColor(Color(custom: "Progress"))
            )
        }
    }
}
