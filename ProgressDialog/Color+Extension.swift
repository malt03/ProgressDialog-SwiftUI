//
//  Color+Extension.swift
//  ProgressDialog
//
//  Created by Koji Murata on 2019/09/19.
//  Copyright © 2019 Koji Murata. All rights reserved.
//

import SwiftUI

extension Color {
    init(custom name: String) {
        self.init(name, bundle: Bundle(for: type(of: Dummy())))
    }
}

private class Dummy {}
