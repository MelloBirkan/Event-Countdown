//
//  Event.swift
//  Event Countdown
//
//  Created by Marcello Gonzatto Birkan on 04/07/24.
//

import SwiftUI

struct Event: Identifiable, Comparable {
  let id = UUID()
  let title: String
  let date: Date
  let textColor: Color
  
  static func < (lhs: Event, rhs: Event) -> Bool {
          return lhs.date < rhs.date
      }
}
