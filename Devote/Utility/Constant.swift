//
//  Constant.swift
//  Devote
//
//  Created by Davide Aliti on 25/07/22.
//

import Foundation
import SwiftUI

// MARK: - Formatter
let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: - UI

// MARK: - UX
var backgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

let feedback: UINotificationFeedbackGenerator = UINotificationFeedbackGenerator()
