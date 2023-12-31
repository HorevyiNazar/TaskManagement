//
//  OffsetKey.swift
//  TaskManagement
//
//  Created by Назар Горевой on 17/11/2023.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
