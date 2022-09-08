//
//  RemindViewController+Row.swift
//  Today
//
//  Created by Nortiz M1 on 2022/09/08.
//

import UIKit

extension ReminderViewController {
	// 세부 보기에 네 가지 개별 알림 세부 사항이 표시됩니다: 제목, 날짜, 시간 및 메모.
	enum Row: Hashable {
		case viewDate
		case viewNotes
		case viewTime
		case viewTitle
		
		var imageName: String? {
			switch self {
			case .viewDate: return "calendar.circle"
			case .viewNotes: return "square.and.pencil"
			case .viewTime: return "clock"
			default: return nil
			}
		}
		
		var image: UIImage? {
			guard let imageName = imageName else { return nil }
			let configuration = UIImage.SymbolConfiguration(textStyle: .headline)
			return UIImage(systemName: imageName, withConfiguration: configuration)
		}
		
		var textStyle: UIFont.TextStyle {
			switch self {
			case .viewTitle: return .headline
			default: return .subheadline
			}
		}
	}
}
