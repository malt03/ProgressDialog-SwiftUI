//
//  ProgressDialog.swift
//  ProgressDialog
//
//  Created by Koji Murata on 2019/09/18.
//  Copyright © 2019 Koji Murata. All rights reserved.
//

import SwiftUI

public struct ProgressDialog: View {
    @ObservedObject var info = ProgressInfo.shared
    
    public init() {}
    
    public var body: some View {
        let progress = ProgressView(progress: info.progress ?? 0).frame(width: 60, height: 60, alignment: .center)
        let indicator = IndicatorView().frame(width: 60, height: 60, alignment: .center)
        let isProgress = info.progress != nil
        
        return Color(custom: "Background").edgesIgnoringSafeArea(.all)
            .overlay(Color(custom: "DialogBackground").frame(width: 120, height: 120, alignment: .center).cornerRadius(16))
            .overlay(progress.opacity(isProgress ? 1 : 0))
            .overlay(indicator.opacity(isProgress ? 0 : 1))
            .modifier(OpacityModifier(opacity: info.isPresenting ? 1 : 0))
    }
    
    struct OpacityModifier: AnimatableModifier {
        var opacity: Double
        var animatableData: Double {
            get { opacity }
            set { opacity = newValue }
        }
        
        func body(content: Content) -> some View {
            var optionalContent: Optional = content
            if opacity == 0 { optionalContent = nil }
            return optionalContent?.opacity(opacity)
        }
    }
}

