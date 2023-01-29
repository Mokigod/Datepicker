//
//  ViewController.swift
//  Datepicker
//
//  Created by 김현목 on 2023/01/29.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime = ""
    
    @IBOutlet var IbICurrentTime: UILabel!
    @IBOutlet var IbIPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        IbIPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
    
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    @objc func updateTime(){
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        IbICurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(for: date)
        
        if(alarmTime == currentTime){
            view.backgroundColor = UIColor.red
        }
        else{
            view.backgroundColor = UIColor.white
        }
        
    }
}

