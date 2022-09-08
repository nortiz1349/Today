//
//  ReminderViewController.swift
//  Today
//
//  Created by Nortiz M1 on 2022/09/08.
//

import UIKit

class ReminderViewController: UICollectionViewController {
	
	// 데이터소스는 제네릭입니다.
	// Int 및 Row 제네릭 매개변수를 지정하면 데이터소스가 행의 섹션번호와 인스턴스에 Int 인스턴스를 사용하도록 컴파일러에 지시합니다.
	private typealias DataSource = UICollectionViewDiffableDataSource<Int, Row>
	private typealias SnapShot = NSDiffableDataSourceSnapshot<Int, Row>
	
	var reminder: Reminder
	private var dataSource: DataSource!
	
	init(reminder: Reminder) {
		self.reminder = reminder
		var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
		listConfiguration.showsSeparators = false
		let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
		super.init(collectionViewLayout: listLayout)
	}
	
	required init?(coder: NSCoder) {
		fatalError("Always initialize ReminderViewController using init(reminder:)")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
		dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Row) in
			return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
		}
		
		navigationItem.title = NSLocalizedString("Reminder", comment: "Reminder view controller title")
		
		updateSnapshot()
	}
	
	func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, row: Row) {
		var contentConfiguration = cell.defaultContentConfiguration() // 이 구성은 행에 기본 스타일을 할당합니다.
		contentConfiguration.text = text(for: row)
		contentConfiguration.textProperties.font = UIFont.preferredFont(forTextStyle: row.textStyle)
		contentConfiguration.image = row.image
		cell.contentConfiguration = contentConfiguration
		cell.tintColor = .todayPrimaryTint
	}
	
	private func updateSnapshot() {
		var snapshot = SnapShot()
		snapshot.appendSections([0])
		snapshot.appendItems([.viewTitle, .viewDate, .viewTime, .viewNotes], toSection: 0)
		dataSource.apply(snapshot)
	}
	
	func text(for row: Row) -> String? {
		switch row {
		case .viewDate: return reminder.dueDate.dayText
		case .viewNotes: return reminder.notes
		case .viewTime: return reminder.dueDate.formatted(date: .omitted, time: .shortened)
		case .viewTitle: return reminder.title
		}
	}
}
