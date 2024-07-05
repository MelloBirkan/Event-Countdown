//
//  ContentView.swift
//  Event Countdown
//
//  Created by Marcello Gonzatto Birkan on 04/07/24.
//

import SwiftUI

struct EventsView: View {
  @State var events = [Event]()
  @State private var isPresentingNewEventView = false
  
  var body: some View {
    NavigationStack {
      if events.isEmpty {
        VStack {
          ContentUnavailableView("Your schedule is currently empty. Add new events to stay organized!", systemImage: "calendar.badge.exclamationmark")
            .frame(height: 200)
          
          Button("Add Event") {
            isPresentingNewEventView.toggle()
          }
          .buttonStyle(BorderedButtonStyle())
        }
      } else {
        List {
          ForEach(events.sorted(by: {$0 < $1})) { event in
            NavigationLink(value: event) {
              EventRow(event: event)
            }
          }
          .onDelete(perform: { indexSet in
            events.remove(atOffsets: indexSet)
          })
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
              isPresentingNewEventView = true
            }) {
              Image(systemName: "plus")
                .font(.title)
            }
          }
        }
        .navigationDestination(for: Event.self, destination: { event in
          EventForm(title: event.title, color: event.textColor, date: event.date, events: $events, isNew: false, oldEvent: event)
        })
        .navigationTitle("Events")
      }
    }
    .sheet(isPresented: $isPresentingNewEventView) {
      NavigationStack {
        EventForm(events: $events, isNew: true, oldEvent: nil)
      }
    }
  }
}

#Preview {
  EventsView(events: [Event(title: "Party", date: .now, textColor: .accentColor)])
}
