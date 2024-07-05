//
//  Event.swift
//  Event Countdown
//
//  Created by Marcello Gonzatto Birkan on 04/07/24.
//

import SwiftUI

struct Event: Identifiable, Comparable, Hashable {
  var id = UUID()
  var title: String
  var date: Date
  var textColor: Color
  
  static func < (lhs: Event, rhs: Event) -> Bool {
          return lhs.date < rhs.date
      }
}
