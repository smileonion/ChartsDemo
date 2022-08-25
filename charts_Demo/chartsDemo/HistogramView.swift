//
//  HistogramView.swift
//  chartsDemo
//
//  Created by zc_mc on 2022/7/27.
//

import UIKit
import Charts
import SnapKit

class HistogramView: UIView {
    //每个分组之间的间隔
    let groupSpace = 0.31
    //同一分组内柱子间隔
    let barSpace = 0.03
    //柱子宽度（ (0.2 + 0.03) * 3 + 0.31 = 1.00 -> interval per "group"）
    let barWidth = 0.2
    
    let groupCount = 10
    
    var barChartView:BarChartView!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    
        addBarChartView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addBarChartView()
    }
    
    func addBarChartView(){
        barChartView = BarChartView()
        self.addSubview(barChartView)
        barChartView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        //无数据展示
        barChartView.noDataText = "暂无数据"
        //数值显示在柱形的上面还是下面
        barChartView.drawValueAboveBarEnabled = true
        //取消Y轴缩放
        barChartView.scaleYEnabled = false
        //取消双击缩放
        barChartView.doubleTapToZoomEnabled = false
        //启用拖拽图表
        barChartView.dragEnabled = true
        //x轴样式
        let xAxis = barChartView.xAxis
        xAxis.axisMinimum = Double(0)
        //设置X轴线宽
        xAxis.axisLineWidth = 1
        //X轴的显示位置，默认是显示在上面的
        xAxis.labelPosition = .bottom
        //不绘制网格线
        xAxis.drawGridLinesEnabled = false
        //label文字颜色
        xAxis.labelTextColor = .lightGray
        xAxis.labelCount = 10
        //不绘制右边轴
        barChartView.rightAxis.enabled = false
        
        //设置左侧Y轴的样式
        let leftAxis = barChartView.leftAxis
        //不强制绘制指定数量的label
        leftAxis.forceLabelsEnabled = false
        //从0开始绘制
        leftAxis.drawZeroLineEnabled = true
        //不绘制网格线
        leftAxis.drawGridLinesEnabled = false
        //设置Y轴的最小值
        leftAxis.axisMinimum = 0
        //Y轴线宽
        leftAxis.axisLineWidth = 0.5
        //Y轴颜色
        leftAxis.axisLineColor = .black
        leftAxis.labelCount = 5
        //设置Y轴上标签的样式
        leftAxis.labelPosition = .outsideChart
        leftAxis.labelTextColor = .red
        leftAxis.labelFont = .systemFont(ofSize: 14)
        
    }
    
    func setData()
    {
        /// 第一组数据
        var dataEntries1 = [BarChartDataEntry]()
        for i in 0...10{
            let y = arc4random()%100 + 150
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries1.append(entry)
        }
        
        let chartDataSet1 = BarChartDataSet.init(entries: dataEntries1, label: "web端")
        
        var dataEntries2 = [BarChartDataEntry]()
        for i in 0...10{
            let y = arc4random()%50
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries2.append(entry)
        }
        let chartDataSet2 = BarChartDataSet.init(entries: dataEntries2, label: "安卓")
        chartDataSet2.colors = [.orange]
        
        var dataEntries3 = [BarChartDataEntry]()
        for i in 0...10{
            let y = arc4random()%50+10
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries3.append(entry)
        }
        let chartDataSet3 = BarChartDataSet.init(entries: dataEntries3, label: "安卓")
        chartDataSet3.colors = [.blue]
        
        let chartData = BarChartData(dataSets: [chartDataSet1,chartDataSet2,chartDataSet3])
        
        chartData.barWidth = barWidth
        
        chartData.groupBars(fromX: Double(0), groupSpace: groupSpace, barSpace: barSpace)
        
        barChartView.xAxis.axisMaximum = Double(0) + chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace) * Double(groupCount)
        barChartView.xAxis.granularity = 1
        barChartView.xAxis.centerAxisLabelsEnabled = true
        barChartView.data = chartData
        
    }
}
