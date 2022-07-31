//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Davide Aliti on 28/07/22.
//

import SwiftUI

struct BackgroundImageView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

// MARK: - Preview
struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
