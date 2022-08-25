//
//  DSLineChartTableViewCell.swift
//  chartsDemo
//
//  Created by zc_mc on 2022/8/11.
//

import UIKit
import Charts

class DSLineChartTableViewCell: UITableViewCell {

    @IBOutlet weak var lineChartView: LineChartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        var entries = [ChartDataEntry]()
        for i in 0...10 {
            let entry = ChartDataEntry(x: Double(i), y: Double(arc4random_uniform(30)))
            entries.append(entry)
        }
        
        let set = LineChartDataSet(entries: entries, label: "图例")
        set.mode = .horizontalBezier // 模式为曲线模式
        set.lineWidth = 2 //折线宽度
        set.circleRadius = 4 //拐点半径
        set.circleHoleRadius = 3 //空心的半径
        set.setCircleColor(.red) //空心的圈的颜色
        set.setColor(.blue) // 线条颜色
        
        
        var entriesTwo = [ChartDataEntry]()
        for i in 0...22 {
            let entry = ChartDataEntry(x: Double(i), y: Double(arc4random_uniform(50)))
            entriesTwo.append(entry)
        }
        let setTwo = LineChartDataSet(entries: entriesTwo, label: "图例")
        setTwo.mode = .horizontalBezier
        setTwo.lineWidth = 2
        setTwo.circleRadius = 4
        setTwo.setCircleColor(.lightGray)
        setTwo.setColor(.orange)
        
        let dataList = LineChartData(dataSets: [set,setTwo])
        lineChartView.data = dataList
        lineChartView.noDataText = "暂无数据"
        lineChartView.xAxis.labelPosition = .bottom // x轴的值显示位置
        lineChartView.xAxis.avoidFirstLastClippingEnabled = true
        lineChartView.rightAxis.enabled = false /// 是否绘制右边
        lineChartView.xAxis.drawGridLinesEnabled = false // 是否绘制网格
        lineChartView.leftAxis.drawGridLinesEnabled = false // 是否绘制网格
        lineChartView.leftAxis.axisMinimum = 0 // 设置Y轴的最小值
        /// 设置显示范围 --- 超出可滑动
        self.lineChartView.setVisibleXRange(minXRange: 1, maxXRange: 8)
        // 自定义格式
        let leftValueFormatter = NumberFormatter()
        leftValueFormatter.positiveSuffix  = "亿"
        lineChartView.leftAxis.valueFormatter = DefaultAxisValueFormatter.init(formatter: leftValueFormatter)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
