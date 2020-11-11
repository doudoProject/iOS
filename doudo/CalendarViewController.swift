//
//  CalendarViewController.swift
//  doudo
//
//  Created by 허예은 on 2020/11/05.
//

import UIKit
import FSCalendar
class CalendarViewController: UIViewController {
    
    @IBOutlet var calendar: FSCalendar!
    var event: [Date] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title="캘린더"
        calendar.delegate = self
        calendar.dataSource = self
        setCalendar()
    }
    
    func setCalendar(){
        calendar.locale = Locale(identifier: "ko_KR")
        calendarEventUpdate()
        calenderColorChange()
        calendarHeaderChange()
        calenderScrollVertical()
    }
    
    func calendarEventUpdate(){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        
        let xmas = formatter.date(from: "2020-12-25")
        let birthday = formatter.date(from: "2020-12-31")
        
        event = [xmas!, birthday!]
    }
    
    func calenderColorChange(){
        calendar.appearance.headerTitleColor = UIColor.black
        calendar.appearance.selectionColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        calendar.appearance.weekdayTextColor = UIColor(red: 255/255, green: 82/255, blue: 82/255, alpha: 1)
        calendar.appearance.todayColor = UIColor(red: 255/255, green: 82/255, blue: 82/255, alpha: 1)
        calendar.appearance.todaySelectionColor = UIColor.red
    }
    
    func calendarHeaderChange(){
        calendar.headerHeight = 50
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.headerDateFormat = "YYYY년 M월"
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 24)
    }
    
    func calenderScrollVertical(){
        calendar.scrollEnabled = true
        calendar.scrollDirection = .vertical
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let string = formatter.string(from: date)
        print("\(string)")
    }
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource{
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if self.event.contains(date){
            return 1
        } else {
            return 0
        }
    }
}
