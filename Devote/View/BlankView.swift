//
//  BlankView.swift
//  Devote
//
//  Created by Davide Aliti on 29/07/22.
//

import SwiftUI

struct BlankView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(.black)
        .opacity(0.5)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - Preview
struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView()
    }
}
