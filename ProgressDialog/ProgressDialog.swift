//
//  ProgressDialog.swift
//  ProgressDialog
//
//  Created by Koji Murata on 2019/09/20.
//  Copyright © 2019 Koji Murata. All rights reserved.
//

import UIKit
import SwiftUI

public class ProgressDialog {
    public static let shared = ProgressDialog()
    
    private var window: UIWindow?
    
    private let progressInfo = ProgressInfo()
    
    public func present(progress: Double? = nil) {
        if window == nil {
            if !createWindow() { return }
        }
        
        withAnimation {
            progressInfo.progress = progress
        }
    }
    
    public func dismiss() {
        let animator = UIViewPropertyAnimator(duration: 0.1, curve: .linear) { self.window?.alpha = 0 }
        animator.addCompletion { _ in self.window = nil }
        animator.startAnimation()
    }
    
    private func createWindow() -> Bool {
        guard let scene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive })
            else { return false }
        let window = UIWindow(windowScene: scene)
        window.alpha = 0
        window.backgroundColor = .clear
        window.rootViewController = UIHostingController(rootView: ProgressDialogView().environmentObject(progressInfo))
        window.rootViewController?.view.backgroundColor = .clear
        window.makeKeyAndVisible()
        
        self.window = window
        
        UIViewPropertyAnimator(duration: 0.1, curve: .linear) { window.alpha = 1 }.startAnimation()
        
        return true
    }
}
