//
//  TaskView.swift
//  TaskManagement
//
//  Created by Назар Горевой on 18/11/2023.
//

import SwiftUI
import SwiftData

struct TaskView: View {
    @Binding var currentDate: Date
    /// Swift Data Dynamic Query
    @Query private var tasks: [Task]
    init(currentDate: Binding<Date>) {
        self._currentDate = currentDate
        /// Predicate
        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: currentDate.wrappedValue)
        let endOfDate = calendar.date(byAdding: .day, value: 1, to: startOfDate)!
        let predicate = #Predicate<Task> {
            return $0.creationDate >= startOfDate && $0.creationDate < endOfDate
        }
        /// Sorting
        let sortDescriptor = [
            SortDescriptor(\Task.creationDate, order: .reverse)
        ]
        self._tasks = Query(filter: predicate, sort: sortDescriptor, animation: .snappy)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 35, content: {
                    ForEach(tasks) { task in
                        TaskRowView(task: task)
                            .background(alignment: .leading) {
                                if tasks.last?.id != task.id {
                                    Rectangle()
                                        .frame(width: 1)
                                        .offset(x: 8)
                                        .padding(.bottom, -35)
                                }
                            }
                    }
                })
                .padding(.vertical, 15)
                .padding(.top, 10)
                .overlay {
                    if tasks.isEmpty {
                        Text("No Task's Found")
                            .font(.caption)
                            .foregroundStyle(.gray)
                            .frame(width: 150)
                    }
                }
                
    }
}

#Preview {
    ContentView()
}
