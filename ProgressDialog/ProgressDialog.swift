//
//  ProgressDialog.swift
//  ProgressDialog
//
//  Created by Koji Murata on 2019/09/18.
//  Copyright © 2019 Koji Murata. All rights reserved.
//

import SwiftUI

public struct ProgressDialog: View {
    public init() {}
    
    public var body: some View {
        Color(UIColor(white: 0, alpha: 0.5)).edgesIgnoringSafeArea(.all)
            .overlay(Color.white.frame(width: 120, height: 120, alignment: .center).cornerRadius(16))
            .overlay(Progress().frame(width: 80, height: 80, alignment: .center))
    }
    
    struct Progress: View {
        @State private var animatableData: Double = 0
        var body: some View {
            Color.clear
                .modifier(ProgressModifier(animatableData: animatableData))
                .onAppear {
                    withAnimation(Animation.linear(duration: 4).repeatForever(autoreverses: false)) {
                        self.animatableData = 1
                    }
                }
        }
    }

    struct ProgressModifier: AnimatableModifier {
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
            return content.overlay(Arg(start: start - 90, end: end - 90))
        }
        
        struct Arg: Shape {
            let start: Double
            let end: Double
            
            func path(in rect: CGRect) -> Path {
                var path = Path()
                path.addArc(
                    center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                    radius: min(rect.width, rect.height) / 2,
                    startAngle: .degrees(start),
                    endAngle: .degrees(end),
                    clockwise: true
                )
                return path.strokedPath(StrokeStyle(lineWidth: 4, lineCap: .round))
            }
        }
    }
}

