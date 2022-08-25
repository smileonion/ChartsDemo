//
//  DSPieChartView.swift
//  chartsDemo
//
//  Created by zc_mc on 2022/7/28.
//

import UIKit
import SnapKit
import Charts

class DSPieChartView: UIView {
    
    var pieChartView:PieChartView!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    
        addPieChartView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addPieChartView()
    }
    
    func addPieChartView(){
        pieChartView = PieChartView()
        self.addSubview(pieChartView)
        pieChartView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        //描述文字
        pieChartView.chartDescription?.text = "饼状图示例"
        //转化为百分比
        pieChartView.usePercentValuesEnabled = true
        //禁止滚动
        pieChartView.rotationEnabled = false
        
        pieChartView.entryLabelColor = .red
    }
    
    func bindPieChartData(){

        let entry1 = PieChartDataEntry(value: Double(arc4random_uniform(50) + 10), label: "web端(100)")
        let entry2 = PieChartDataEntry(value: Double(arc4random_uniform(50) + 10), label: "ios端")
        let entry3 = PieChartDataEntry(value: Double(arc4random_uniform(50) + 10), label: "安卓端")
        let chartDataSet = PieChartDataSet(entries: [entry1,entry2,entry3], label: "")
        chartDataSet.colors = [.red,.blue,.green]
        chartDataSet.xValuePosition = .outsideSlice //标签显示在外
        chartDataSet.yValuePosition = .outsideSlice //数值显示在外
        chartDataSet.selectionShift = 5 //扇形伸出范围
        
        //指示折线样式
        chartDataSet.valueLinePart1OffsetPercentage = 1 //折线中第一段起始位置相对于区块的偏移量, 数值越大, 折线距离区块越远
        chartDataSet.valueLinePart1Length = 0.4 //折线中第一段长度占比
        chartDataSet.valueLinePart2Length = 0.6//折线中第二段长度最大占比
        chartDataSet.valueLineWidth = 1 //折线的粗细
        chartDataSet.valueLineColor = UIColor.brown //折线颜色
        let chartData = PieChartData(dataSet: chartDataSet)
        chartData.setValueTextColor(.blue)
        //数值百分比格式化显示
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = "%"
        chartData.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        pieChartView.data = chartData
    }
}
