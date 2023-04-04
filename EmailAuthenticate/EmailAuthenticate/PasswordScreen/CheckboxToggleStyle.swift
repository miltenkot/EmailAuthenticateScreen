//
//  CheckboxToggleStyle.swift
//  EmailAuthenticate
//
//  Created by Bartłomiej on 04/04/2023.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(configuration.isOn ? .blue : .white)
            .overlay {
                if !configuration.isOn {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.blue, lineWidth: 5)
                }
            }
            .cornerRadius(8)
            .onTapGesture {
                configuration.isOn.toggle()
            }
    }
}
