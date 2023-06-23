//
//  ViewController.swift
//  DemoChart
//
//  Created by Vũ Đình Duẩn on 19/06/2023.
//

import UIKit

class ViewController: UIViewController {
    var chartDataSource: [chartData] = []
    var chartView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Bước 1: Khởi tạo Data
        initChartData()
        
        // Bước 2: Tạo một biểu đồ (chart view)
        chartView = UIView(frame: CGRect(x: 20, y: 50, width: self.view.frame.width, height: 200))
        chartView.backgroundColor = .lightGray
        
        // Bước 3: Add chartView vào trong View cha
        self.view.addSubview(chartView)
        
//        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 200))
//            scrollView.contentSize = CGSize(width: chartView.frame.width, height: chartView.frame.height)
//            scrollView.addSubview(chartView)
//            self.view.addSubview(scrollView)
        
        // Bước 4: Vẽ biểu đồ
        drawChart()
        drawChartLabels()
        drawYLabels()
        
        
    }
    
    // Hàm này để vẽ biểu đồ
    func drawChart() {
        for (i, currentData) in chartDataSource.enumerated() {
            let currentX = 15 + (i * 30)
            let currentHeight = (currentData.value/maxValueInChart()) * (chartView.frame.height * 0.9)
            let currentY = chartView.frame.height - currentHeight
            
            let currentColumn = UIView(frame: CGRect(x: Double(currentX + 30), y: currentY, width: 25, height: currentHeight))
            currentColumn.backgroundColor = currentData.color
            
            //Bước 5: Add cột hiện tại vào charview
            chartView.addSubview(currentColumn)
        }
    }
    
    // Hàm này để tìm dữ liệu lớn nhất trong các cột
    func maxValueInChart() -> Double {
        var maxValue = chartDataSource[0].value
        for data in chartDataSource {
            if data.value > maxValue {
                maxValue = data.value
            }
        }
        return maxValue
    }
    
    func drawChartLabels(){
            for (i, currentData) in chartDataSource.enumerated() {
                let labelX = 15 + (i * 30) + 30
                let labelY = chartView.frame.height

                let valueX = UILabel(frame: CGRect(x: labelX , y: Int(labelY) , width: 25, height: 20))
                valueX.text = currentData.type
                valueX.textAlignment = .center
                valueX.font = UIFont.systemFont(ofSize: 10)
                valueX.textColor = .black
                chartView.addSubview(valueX)

                let valueY = UILabel(frame: CGRect(x: labelX, y: Int(labelY - (currentData.value/maxValueInChart()) * (chartView.frame.height * 0.8)) , width: 25, height: 20))
                valueY.text = String(currentData.value)
                valueY.textAlignment = .center
                valueY.font = UIFont.systemFont(ofSize: 10)
                valueY.textColor = .black
                chartView.addSubview(valueY)
            }
        }

        func drawYLabels() {
            //let values: [Int] = [0,5000,10000,15000,20000,25000,30000,35000,40000]
            let maxChartValue = chartDataSource.map { $0.value }.max() ?? 0
            let values: [Int] = initYValues(maxValue: Int(maxChartValue))
            let maxValue = CGFloat(maxValueInChart())
            let chartHeight = chartView.frame.height * 0.8

            for value in values {
                let labelY = chartView.frame.height - (CGFloat(value) / maxValue ) * chartHeight - 20
                let label = UILabel(frame: CGRect(x: 0, y: labelY, width: 40, height: 20))
                label.text = String(value)
                label.textAlignment = .right
                label.font = UIFont.systemFont(ofSize: 10)
                label.textColor = .black

                chartView.addSubview(label)
            }
        }

        func initYValues(maxValue: Int) -> [Int] {
            let numberOfStep = 6
            var values: [Int] = []
            let step = maxValue / (numberOfStep - 1)
            for i in 0..<numberOfStep  {
                let value = step * i
                values.append(value)
            }
            return values
        }
    
    // Hàm này để khởi tạo mảng dữ liệu trong biểu đồ
    func initChartData() {
        let thang1 = chartData(type: "January ", value: 12000, color: .red)
        let thang2 = chartData(type: "February", value: 20000, color: .green)
        let thang3 = chartData(type: "March", value: 15000, color: .yellow)
        let thang4 = chartData(type: "April", value: 19000, color: .orange)
        let thang5 = chartData(type: "May", value: 17000, color: .blue)
        let thang6 = chartData(type: "June", value: 20000, color: .systemPink)
        let thang7 = chartData(type: "July", value: 35000, color: .separator)
        let thang8 = chartData(type: "August", value: 25000, color: .systemPink)
        let thang9 = chartData(type: "September", value: 11000, color: .systemPink)
        let thang10 = chartData(type: "October", value: 5000, color: .systemPink)
        let thang11 = chartData(type: "November", value: 7000, color: .white)
        let thang12 = chartData(type: "Dercember", value: 14000, color: .systemPink)
        chartDataSource.append(thang1)
        chartDataSource.append(thang2)
        chartDataSource.append(thang3)
        chartDataSource.append(thang4)
        chartDataSource.append(thang5)
        chartDataSource.append(thang6)
        chartDataSource.append(thang7)
        chartDataSource.append(thang8)
        chartDataSource.append(thang9)
        chartDataSource.append(thang10)
        chartDataSource.append(thang11)
        chartDataSource.append(thang12)
    }
}

