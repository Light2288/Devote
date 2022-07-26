//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Davide Aliti on 27/07/22.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
