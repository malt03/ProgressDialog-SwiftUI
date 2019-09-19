//
//  ProgressInfo.swift
//  ProgressDialog
//
//  Created by Koji Murata on 2019/09/19.
//  Copyright © 2019 Koji Murata. All rights reserved.
//

import Foundation
import SwiftUI

public final class ProgressInfo: ObservableObject {
    public static let shared = ProgressInfo()
    
    @Published private(set) var isPresenting = false
    @Published private(set) var progress: Double? = nil
    
    public func present(progress: Double? = nil) {
        withAnimation {
            self.progress = progress
            isPresenting = true
        }
    }
    
    public func dismiss() {
        withAnimation {
            isPresenting = false
        }
    }
}
