//
//  ReminderListViewController+Action.swift
//  Today
//
//  Created by Nortiz M1 on 2022/09/07.
//

import UIKit

extension ReminderListViewController {
	@objc func didPressDoneButton(_ sender: ReminderDoneButton) {
		guard let id = sender.id else { return }
		completeReminder(with: id)
	}
}
