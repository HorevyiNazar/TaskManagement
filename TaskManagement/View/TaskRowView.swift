//
//  TaskRowView.swift
//  TaskManagement
//
//  Created by Назар Горевой on 17/11/2023.
//

import SwiftUI

struct TaskRowView: View {
    @Binding var task: Task
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Circle()
                .fill(.darkBlue)
                .frame(width: 10, height: 10)
                .padding(4)
                .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in: .circle)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text(task.taskTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                
                Label(task.creationDate.format("hh:mm a"), systemImage: "clock")
                    .font(.caption)
                    .foregroundStyle(.black)
            })
            .padding(15)
            .hSpacing(.leading)
            .background(task.tint, in: .rect(topLeadingRadius: 15, bottomLeadingRadius: 15))
            .strikethrough(task.isCompleted, pattern: .solid, color: .black)
            .offset(y: -8)
        }
        
    }
}

#Preview {
    ContentView()
}
