//
//  Date+Today.swift
//  Today
//
//  Created by Nortiz M1 on 2022/09/07.
//

import Foundation

extension Date {
	/*
	 현재 날짜로 예정된 알림에 대해 미리 알림 날짜를 "오늘 오후 3시"로 표시함으로써 긴박감을 전달할 것입니다.
	 알림 날짜가 현재 날짜가 아니라면 "10월 22일 오후 3시"와 같은 문자열을 사용할 수 있습니다.
	 */
	var dayAndTimeText: String {
		let timeText = formatted(date: .omitted, time: .shortened)
		if Locale.current.calendar.isDateInToday(self) { // 달력이 오늘 날짜인지 테스트
			let timeFormat = NSLocalizedString("Today at %@", comment: "Today at time format string")
			return String(format: timeFormat, timeText)
		} else {
			let dateText = formatted(.dateTime.month(.abbreviated).day())
			let dateAndTimeFormat = NSLocalizedString("%@ at %@", comment: "Date and time format string")
			return String(format: dateAndTimeFormat, dateText, timeText)
		}
	}
	var dayText: String {
		if Locale.current.calendar.isDateInToday(self) {
			return NSLocalizedString("Today", comment: "Today due date description")
		} else {
			return formatted(.dateTime.month().day().weekday(.wide))
		}
	}
}
