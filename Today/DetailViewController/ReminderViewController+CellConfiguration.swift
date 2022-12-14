//
//  ReminderViewController+CellConfiguration.swift
//  Today
//
//  Created by Nortiz M1 on 2022/09/10.
//

import UIKit

extension ReminderViewController {
	
	func defaultConfiguration(for cell: UICollectionViewListCell, at row: Row) -> UIListContentConfiguration {
		var contentConfiguration = cell.defaultContentConfiguration() // 이 구성은 행에 기본 스타일을 할당합니다.
		contentConfiguration.text = text(for: row)
		contentConfiguration.textProperties.font = UIFont.preferredFont(forTextStyle: row.textStyle)
		contentConfiguration.image = row.image
		return contentConfiguration
	}
	
	func headerConfiguration(for cell:UICollectionViewListCell, with title: String) -> UIListContentConfiguration {
		var contenConfiguration = cell.defaultContentConfiguration()
		contenConfiguration.text = title
		return contenConfiguration
	}
	
	func titleConfiguration(for cell: UICollectionViewListCell, with title: String?) -> TextFieldContentView.Configuration {
		var contentConfiguration = cell.textFieldConfiguration()
		contentConfiguration.text = title
		contentConfiguration.onChange = { [weak self] title in
			self?.workingReminder.title = title
		}
		return contentConfiguration
	}
	
	func dateConfiguration(for cell: UICollectionViewListCell, with date: Date) -> DatePickerContentView.Configuration {
		var contentConfiguration = cell.datePickerConfiguration()
		contentConfiguration.date = date
		contentConfiguration.onChange = { [weak self] dueDate in
			self?.workingReminder.dueDate = dueDate
		}
		return contentConfiguration
	}
	
	func notesConfiguration(for cell: UICollectionViewListCell, with notes: String?) -> TextViewContentView.Configuration {
		var contentConfiguration = cell.textViewConfiguration()
		contentConfiguration.text = notes
		contentConfiguration.onChange = { [weak self] notes in
			self?.workingReminder.notes = notes
		}
		return contentConfiguration
	}
	
	func text(for row: Row) -> String? {
		switch row {
		case .viewDate: return reminder.dueDate.dayText
		case .viewNotes: return reminder.notes
		case .viewTime: return reminder.dueDate.formatted(date: .omitted, time: .shortened)
		case .viewTitle: return reminder.title
		default: return nil
		}
	}
}
