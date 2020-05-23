//
//  TimeFormatUtil.swift
//  MovieNews
//
//  Created by Meruyert Tastandiyeva on 5/21/20.
//  Copyright © 2020 Meruyert Tastandiyeva. All rights reserved.
//

import Foundation

class TimeFormatUtil {
    class func formatDuration(minutes: Int) -> String {
        let hour = minutes / 60;
        let minute = minutes % 60;

        if hour == 0 {
            return String(format: "%02dmin", minute);
        } else {
            return String(format: "%02dh %02dmin", hour, minute);
        }
    }
}
