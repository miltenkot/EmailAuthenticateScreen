//
//  KeyboardIgnoring.swift
//  EmailAuthenticate
//
//  Created by Bartlomiej Lanczyk on 17/12/2023.
//

import SwiftUI
import Combine

public extension View {
    func keyboardIgnoring(padding: CGFloat = 100) -> some View {
        modifier(KeyboardIgnoring(padding: padding))
    }
}

public struct KeyboardIgnoring: ViewModifier {
    @State private var keyboardActiveAdjustment: CGFloat = 0
    var padding: CGFloat
    
    init(padding: CGFloat) {
        self.padding = padding
    }

    public func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .bottom, spacing: keyboardActiveAdjustment) {
                EmptyView().frame(height: 0)
            }
            .onReceive(Publishers.keyboardHeight) {
                self.keyboardActiveAdjustment = min($0, padding)
            }
    }
}

public extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }

        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

public extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}
