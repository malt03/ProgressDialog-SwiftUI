//
//  ProgressInfo.swift
//  ProgressDialog
//
//  Created by Koji Murata on 2019/09/19.
//  Copyright © 2019 Koji Murata. All rights reserved.
//

import Foundation
import SwiftUI

final class ProgressInfo: ObservableObject {
    @Published var progress: Double? = nil
}
