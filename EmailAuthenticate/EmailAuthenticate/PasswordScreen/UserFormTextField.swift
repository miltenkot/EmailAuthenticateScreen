//
//  UserFormTextField.swift
//  EmailAuthenticate
//
//  Created by Bartłomiej on 04/04/2023.
//

import SwiftUI

enum UserFormType {
    case password, repeatPassword
    
    var title: String {
        switch self {
        case .password:
            return "Password"
        case .repeatPassword:
            return "Repeat Password"
        }
    }
}

struct UserFormTextField: View {
    @Binding var text: String
    var type: UserFormType
    @State private var isSecure = true
    
    var body: some View {
        VStack(alignment: .leading) {
            if isSecure {
                SecureField("\(type.title)", text: $text)
            } else {
                TextField("\(type.title)", text: $text)
            }
        }
        .font(.body)
        .padding()
        .frame(maxHeight: 60)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray, lineWidth: 2)
        )
        .overlay {
            HStack {
                Spacer()
                Button("", systemImage: isSecure ? "eye.fill" : "eye.slash.fill") {
                    
                    isSecure.toggle()
                }
                .padding(.trailing)
                .tint(.gray)
                .contentTransition(.symbolEffect(.replace))
            }
        }
        
    }
}

struct UserFormTextField_Previews: PreviewProvider {
    static var previews: some View {
        UserFormTextField(text: .constant("default"), type: .password)
    }
}
