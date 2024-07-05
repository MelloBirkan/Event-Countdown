//
//  EventForm.swift
//  Event Countdown
//
//  Created by Marcello Gonzatto Birkan on 05/07/24.
//

import SwiftUI

struct EventForm: View {
  @Environment(\.dismiss) var dismiss
  @State var title: String = ""
  @State var color = Color.accentColor
  @State var date = Date()
  @Binding var events: [Event]
  var isNew: Bool = true
  var oldEvent: Event?
  
  var body: some View {
    NavigationStack {
      Form {
        Section("Event Details") {
          TextField("Event Title", text: $title)
          
          DatePicker("Event Date", selection: $date)
          
          ColorPicker("Event Text Color", selection: $color)
        }
      }
      .toolbar {
        ToolbarItem(placement: .confirmationAction) {
          Button("Confirm") {
            if !isNew {
              let index = events.firstIndex(of: oldEvent!)
              events[index!] = Event(title: title, date: date, textColor: color)
            } else {
              events.append(Event(title: title, date: date, textColor: color))
            }
            dismiss()
          }
          .disabled(title.isEmpty)
        }
        
        if isNew {
          ToolbarItem(placement: .cancellationAction) {
            Button("Cancel") {
              dismiss()
            }
            .foregroundStyle(.red)
          }
        }
      }
      .navigationTitle(title.isEmpty ? "Event" : title)
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  NavigationStack {
    EventForm(events: .constant([]))
  }
}
