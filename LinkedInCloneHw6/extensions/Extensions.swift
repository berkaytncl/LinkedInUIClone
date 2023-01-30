//
//  Extensions.swift
//  LinkedInCloneHw6
//
//  Created by Berkay Tuncel on 30.01.2023.
//

import Foundation

extension Date {

    static func -(recent: Date, previous: Date) -> (month: Int, day: Int, hour: Int, minute: Int) {
        let month = Calendar.current.dateComponents([.month], from: previous, to: recent).month ?? 0
        let day = Calendar.current.dateComponents([.day], from: previous, to: recent).day ?? 0
        let hour = Calendar.current.dateComponents([.hour], from: previous, to: recent).hour ?? 0
        let minute = Calendar.current.dateComponents([.minute], from: previous, to: recent).minute ?? 0

        return (month: month, day: day, hour: hour, minute: minute)
    }

}
