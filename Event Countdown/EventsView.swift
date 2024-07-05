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
      
      Group {
        if events.isEmpty {
          ContentUnavailableView("Your schedule is currently empty. Add new events to stay organized!", systemImage: "calendar.badge.exclamationmark")
        } else {
          List(events) { event in
          }
        }
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
      .sheet(isPresented: $isPresentingNewEventView) {
        EventForm(isPresented: $isPresentingNewEventView, events: $events)
      }
    }
    .navigationTitle("Events")
  }
}

#Preview {
  EventsView()
}
