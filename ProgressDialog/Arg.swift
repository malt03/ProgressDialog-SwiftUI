//
//  Arg.swift
//  ProgressDialog
//
//  Created by Koji Murata on 2019/09/19.
//  Copyright © 2019 Koji Murata. All rights reserved.
//

import SwiftUI

struct Arg: Shape {
    let start: Double
    let end: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.width / 2, y: rect.height / 2),
            radius: min(rect.width, rect.height) / 2,
            startAngle: .degrees(start - 90),
            endAngle: .degrees(end - 90),
            clockwise: true
        )
        return path.strokedPath(StrokeStyle(lineWidth: 4, lineCap: .round))
    }
}
