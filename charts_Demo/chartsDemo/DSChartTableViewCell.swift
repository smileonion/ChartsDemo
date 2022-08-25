//
//  DSChartTableViewCell.swift
//  chartsDemo
//
//  Created by zc_mc on 2022/7/27.
//

import UIKit
import Charts
import SnapKit

class DSChartTableViewCell: UITableViewCell {
 
    @IBOutlet weak var barChartView: UIView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        initChartView()
        // Initialization code
    }

    func initChartView(){
//        let chartView = HistogramView()
//        barChartView.addSubview(chartView)
//        chartView.snp.makeConstraints { make in
//            make.top.left.right.bottom.equalTo(0)
//        }
//        chartView.setData()
         let chartView = DSPieChartView()
         barChartView.addSubview(chartView)
         chartView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
         }
         chartView.bindPieChartData()
        
//        barChartView.drawValueAboveBarEnabled = true
//        barChartView.scaleYEnabled = false
//        barChartView.doubleTapToZoomEnabled = false
//        barChartView.dragEnabled = true
//        let xAxis = barChartView.xAxis
//        xAxis.axisMinimum = Double(0)
//        xAxis.labelPosition = .bottom
//        xAxis.drawGridLinesEnabled = false
//        xAxis.labelTextColor = .lightGray
//        xAxis.labelCount = 10
//
//        barChartView.rightAxis.enabled = false
//
//        let leftAxis = barChartView.leftAxis
//        leftAxis.forceLabelsEnabled = false
//        leftAxis.drawZeroLineEnabled = true
//        leftAxis.drawGridLinesEnabled = false
//        leftAxis.axisMinimum = 0
//        leftAxis.inverted = false
//        leftAxis.axisLineWidth = 0.5
//        leftAxis.axisLineColor = .black
//        leftAxis.labelCount = 5
//        leftAxis.forceLabelsEnabled = false
//        leftAxis.labelPosition = .outsideChart
//        leftAxis.labelTextColor = .red
//        leftAxis.labelFont = .systemFont(ofSize: 14)
        
//        setData()
    }
    
//    func setData()
//    {
//        /// 第一组数据
//        var dataEntries1 = [BarChartDataEntry]()
//        for i in 0...10{
//            let y = arc4random()%100 + 150
//            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
//            dataEntries1.append(entry)
//        }
//
//        let chartDataSet1 = BarChartDataSet.init(entries: dataEntries1, label: "web端")
//
//        var dataEntries2 = [BarChartDataEntry]()
//        for i in 0...10{
//            let y = arc4random()%50
//            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
//            dataEntries2.append(entry)
//        }
//        let chartDataSet2 = BarChartDataSet.init(entries: dataEntries2, label: "安卓")
//        chartDataSet2.colors = [.orange]
//
//        var dataEntries3 = [BarChartDataEntry]()
//        for i in 0...10{
//            let y = arc4random()%50+10
//            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
//            dataEntries3.append(entry)
//        }
//        let chartDataSet3 = BarChartDataSet.init(entries: dataEntries3, label: "安卓")
//        chartDataSet3.colors = [.blue]
//
//        let chartData = BarChartData(dataSets: [chartDataSet1,chartDataSet2,chartDataSet3])
//
//        chartData.barWidth = barWidth
//
//        chartData.groupBars(fromX: Double(0), groupSpace: groupSpace, barSpace: barSpace)
//
//        barChartView.xAxis.axisMaximum = Double(0) + chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace) * Double(groupCount)
//        barChartView.xAxis.granularity = 1
//        barChartView.xAxis.centerAxisLabelsEnabled = true
//        barChartView.data = chartData
//
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
