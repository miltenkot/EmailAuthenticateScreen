//
//  RequirementsPickerView.swift
//  EmailAuthenticate
//
//  Created by Bartłomiej on 04/04/2023.
//

import SwiftUI

enum RequirementsType {
    case eightChar, spacialChar, oneDigit, upperCaseChar, confirmation
    
    var description: LocalizedStringKey {
        switch self {
        case .eightChar:
            return "8 characters"
        case .spacialChar:
            return "One special character"
        case .oneDigit:
            return "One digit"
        case .upperCaseChar:
           return "One uppercase letter"
        case .confirmation:
            return "The password and confirmation must match"
        }
    }
}

struct RequirementsPickerView: View {
    var type: RequirementsType
    @Binding var toggleState: Bool
    
    var body: some View {
        HStack {
            Toggle("", isOn: $toggleState.animation(.easeInOut))
                .toggleStyle(CheckboxToggleStyle())
                .disabled(true)
                .frame(width: 30, height: 30)
            Text(type.description)
                .font(.headline)
            Spacer()
        }
    }
}

struct RequirementsPickerView_Previews: PreviewProvider {
    static var previews: some View {
        RequirementsPickerView(type: .eightChar, toggleState: .constant(false))
    }
}
