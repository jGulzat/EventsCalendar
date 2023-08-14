//
//  ViewController.swift
//  test
//
//  Created by Gulzat on 14/8/23.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    private func initUI() {
        view.backgroundColor = .white
        
        navigationItem.title = "Events calendar"
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addEvent))
        navigationItem.rightBarButtonItem = add
        
        createCalendar()
    }
    
    @objc func addEvent() {
        let vc = AddEventViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createCalendar() {
        let calendarView = UICalendarView()
        calendarView.calendar = .current
        calendarView.locale = .current
        calendarView.fontDesign = .rounded
        
        calendarView.delegate = self
        
        view.addSubview(calendarView)
        
        calendarView.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview().inset(20)
            make.height.equalTo(600)
        }
    }
}

extension HomeViewController: UICalendarViewDelegate {
    
//    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
//        let font = UIFont.systemFont(ofSize: 10)
//        let configuration = UIImage.SymbolConfiguration(font: font)
//        let image = UIImage(systemName: "star.fill", withConfiguration: configuration)?.withRenderingMode(.alwaysOriginal)
//        return .image(image)
//    }
    
    func calendarView(_ calendarView: UICalendarView, didChangeVisibleDateComponentsFrom previousDateComponents: DateComponents) {
        print("previousDateComponents: \(previousDateComponents)")
    }
}

