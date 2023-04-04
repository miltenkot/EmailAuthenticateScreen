//
//  SignUpPasswordScreen.swift
//  EmailAuthenticate
//
//  Created by Bartłomiej on 04/04/2023.
//

import SwiftUI

struct SignUpPasswordScreen: View {
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var toggleState = false
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Password")
                        .font(.title)
                        .bold()
                    Text("Password must have more than 8 characters, contain some special character, one digit, one uppercase letter")
                        .font(.caption)
                }
                Group {
                    UserFormTextField(text: $password, type: .password)
                    VStack(alignment: .leading) {
                        RequirementsPickerView(type: .eightChar, toggleState: $toggleState)
                        RequirementsPickerView(type: .spacialChar, toggleState: $toggleState)
                        RequirementsPickerView(type: .oneDigit, toggleState: $toggleState)
                        RequirementsPickerView(type: .upperCaseChar, toggleState: $toggleState)
                    }
                    UserFormTextField(text: $confirmPassword, type: .repeatPassword)
                    RequirementsPickerView(type: .confirmation, toggleState: $toggleState)
                }.padding(.vertical, 5)
                Spacer()
                Button {
                    // sign up action
                } label: {
                    Text("Sign Up")
                        .font(.system(size: 19.5, weight: .medium))
                       
                }
                .frame(width: 300, height: 50)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(6)
            }
            .padding()
        }
    }
}

struct SignUpPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPasswordScreen()
    }
}
