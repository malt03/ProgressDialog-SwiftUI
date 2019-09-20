//
//  ContentView.swift
//  SampleApp
//
//  Created by Koji Murata on 2019/09/18.
//  Copyright © 2019 Koji Murata. All rights reserved.
//

import SwiftUI
import ProgressDialog

struct ContentView: View {
    var body: some View {
        List {
            Button(action: {
                ProgressDialog.shared.present()
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    ProgressDialog.shared.dismiss()
                }
            }, label: { Text("Present") })

            Button(action: {
                ProgressDialog.shared.present(progress: 0)
                for progress in [0.3, 0.6, 1] {
                    DispatchQueue.main.asyncAfter(deadline: .now() + progress * 1.8) {
                        ProgressDialog.shared.present(progress: progress)
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    ProgressDialog.shared.dismiss()
                }
            }, label: { Text("Present with Progress") })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
