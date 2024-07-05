//
//  EventRow.swift
//  Event Countdown
//
//  Created by Marcello Gonzatto Birkan on 05/07/24.
//

import SwiftUI

struct EventRow: View {
  let event: Event
  @State private var relativeTime: String = ""
  
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(event.title)
        .foregroundStyle(event.textColor)
        .bold()
        .font(.title2)
      
      Text(relativeTime)
        .foregroundStyle(.secondary)
    }
    .onAppear(perform: updateRelativeTime)
            .onReceive(timer) { _ in
                updateRelativeTime()
            }
  }
  private func updateRelativeTime() {
          let formatter = RelativeDateTimeFormatter()
          formatter.unitsStyle = .full
          relativeTime = formatter.localizedString(for: event.date, relativeTo: Date())
      }
}

#Preview {
  EventRow(event: .init(title: "Festa", date: .now, textColor: .brown))
}
