//
//  veryfirstappApp.swift
//  veryfirstapp
//
//  Created by SAKSHI GUPTA on 15/05/24.
//

import SwiftUI
import FirebaseCore


@main
struct veryfirstappApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
