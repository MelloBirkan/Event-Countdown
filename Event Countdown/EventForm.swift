//
//  EventForm.swift
//  Event Countdown
//
//  Created by Marcello Gonzatto Birkan on 05/07/24.
//

import SwiftUI

struct EventForm: View {
  @State var title: String = ""
  @State var color = Color.accentColor
  @State var date = Date()
  @Binding var isPresented: Bool
  @Binding var events: [Event]
  
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
            events.append(Event(title: title, date: date, textColor: color))
            isPresented = false
          }
          .disabled(title.isEmpty)
        }
        
        ToolbarItem(placement: .cancellationAction) {
          Button("Cancel") {
            isPresented = false
          }
          .foregroundStyle(.red)
        }
      }
      .navigationTitle(title.isEmpty ? "Event" : title)
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  NavigationStack {
    EventForm(isPresented: .constant(true), events: .constant([]))
  }
}
