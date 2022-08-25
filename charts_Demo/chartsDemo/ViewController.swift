//
//  ViewController.swift
//  chartsDemo
//
//  Created by zc_mc on 2022/7/18.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var pieChartView: PieChartView!
    
    @IBOutlet weak var barChartView: BarChartView!
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataEntries = (0..<5).map { i in
            return PieChartDataEntry(value: Double(arc4random_uniform(50)+10), label: "数据\(i)")
        }
        let chartDataSet = PieChartDataSet.init(entries: dataEntries, label: "数据分布")
        chartDataSet.colors = ChartColorTemplates.vordiplom() + ChartColorTemplates.joyful() + ChartColorTemplates.colorful() + ChartColorTemplates.liberty() + ChartColorTemplates.pastel()
        chartDataSet.xValuePosition = .insideSlice // 显示在内
        chartDataSet.yValuePosition = .outsideSlice // 显示在外
        
        let chartData = PieChartData.init(dataSet: chartDataSet)
        chartData.setValueTextColor(UIColor.green)
        
        pieChartView.data = chartData
        
        initBarCharView()
        initLineChartView()
        // Do any additional setup after loading the view.
    }
    
    func initLineChartView(){
        lineChartView.delegate = self
         var dataList = [BarChartDataEntry]()
         for i in 1..<20{
            let entry = BarChartDataEntry(x: Double(i), y: Double(i*10))
            dataList.append(entry)
         }
         let charDataSet = LineChartDataSet(entries: dataList, label: "AAAA")
         let chartData = LineChartData(dataSets: [charDataSet])
         lineChartView.xAxis.labelPosition = .bottom
         lineChartView.doubleTapToZoomEnabled = true
         lineChartView.scaleXEnabled = true
         lineChartView.scaleYEnabled = false
         lineChartView.dragEnabled = true
         lineChartView.highlightPerTapEnabled = true
         
        lineChartView.rightAxis.enabled = false
        let leftAxis = lineChartView.leftAxis
        leftAxis.labelCount = 5;
        leftAxis.forceLabelsEnabled = true
  
        leftAxis.labelFont = UIFont.systemFont(ofSize: 12)
        leftAxis.labelPosition = .outsideChart
    
        leftAxis.gridAntialiasEnabled = false;//抗锯齿
//            leftAxis.axisMaximum = 500;//最大值
        leftAxis.axisMinimum = 0;
        leftAxis.labelCount = 5;//多少等分
        
        //x轴
        let xAxis = lineChartView.xAxis
        xAxis.granularityEnabled = true
 
        xAxis.labelFont = UIFont.systemFont(ofSize: 12.0)
        xAxis.labelPosition = .bottom
  
        xAxis.axisLineColor = UIColor.black
        xAxis.labelCount = 7
        lineChartView.setVisibleXRangeMaximum(10)
        lineChartView.data = chartData
    }

    func initBarCharView(){
        
        //基本样式
        barChartView.noDataText = "You need to provide data for the chart." //没有数据时的文字提示
        barChartView.drawValueAboveBarEnabled = true  //数值显示在柱形的上面还是下面
        barChartView.drawBarShadowEnabled = false  //是否绘制柱形的阴影背景
        //barChartView的交互设置
        barChartView.scaleXEnabled = true
        self.barChartView.scaleYEnabled = false  //取消Y轴缩放
        self.barChartView.doubleTapToZoomEnabled = false   //取消双击缩放
        self.barChartView.dragEnabled = true  //启用拖拽图表
        self.barChartView.dragDecelerationEnabled = false  //拖拽后是否有惯性效果
        self.barChartView.dragDecelerationFrictionCoef = 0 //拖拽后惯性效果的摩擦系数(0~1)，数值越小，惯性越不明显
        //设置barChartView的X轴样式
        let xAxis = self.barChartView.xAxis
        xAxis.axisLineWidth = 1  //设置X轴线宽
        xAxis.labelPosition = .bottom  //X轴的显示位置，默认是显示在上面的
        xAxis.drawGridLinesEnabled = true   //不绘制网格线
        //xAxis.l = 4  //设置label间隔，若设置为1，则如果能全部显示，则每个柱形下面都会显示label
        xAxis.labelTextColor = UIColor.brown //label文字颜色
        xAxis.labelCount = 10
        
        self.barChartView.rightAxis.enabled = false  //不绘制右边轴
        //设置左侧Y轴的样式
        let leftAxis = self.barChartView.leftAxis
        leftAxis.forceLabelsEnabled = false   //不强制绘制制定数量的label
        //leftAxis = false  //是否只显示最大值和最小值
        leftAxis.axisMinimum = -40  //设置Y轴的最小值
        leftAxis.drawZeroLineEnabled = true   //从0开始绘制
        leftAxis.axisMaximum = 105   //设置Y轴的最大值
        leftAxis.inverted = false   //是否将Y轴进行上下翻转
        leftAxis.axisLineWidth = 0.5    //Y轴线宽
        leftAxis.axisLineColor =  UIColor.black  //Y轴颜色
        leftAxis.labelCount = 5
        leftAxis.forceLabelsEnabled = false
        
        //设置Y轴上标签的样式
        leftAxis.labelPosition = .outsideChart   //label位置
        leftAxis.labelTextColor = UIColor.brown   //文字颜色
        leftAxis.labelFont = UIFont.systemFont(ofSize: 10)  //文字字体
        
        //设置Y轴上标签显示数字的格式
        let  leftFormatter = NumberFormatter()  //自定义格式
        leftFormatter.positiveSuffix = " $"  //数字后缀单位
        barChartView.leftAxis.valueFormatter = DefaultAxisValueFormatter.init(formatter: leftFormatter)
        
        //设置Y轴上网格线的样式
        leftAxis.gridLineDashLengths = [3.0, 3.0]   //设置虚线样式的网格线
        leftAxis.gridColor = UIColor.init(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1.0)  //网格线颜色
        leftAxis.gridAntialiasEnabled = true   //开启抗锯齿
        
        let limitLine = ChartLimitLine(limit: 20, label: "限制线")
        limitLine.lineWidth = 2
        limitLine.lineColor = UIColor.green
        limitLine.lineDashLengths = [5.0, 5.0]   //虚线样式
        limitLine.labelPosition = .topRight  //位置
        leftAxis.addLimitLine(limitLine)  //添加到Y轴上
        leftAxis.drawLimitLinesBehindDataEnabled = true  //设置限制线绘制在柱形图的后面
        
        self.barChartView.legend.enabled = false  //不显示图例说明
        self.barChartView.chartDescription?.text = "" //不显示，就设为空字符串即可
        
        
        self.setData()
        
//        var dataList = [BarChartDataEntry]()
//        for i in 1..<20{
//            let entry = BarChartDataEntry(x: Double(i), y: Double(i*10))
//            dataList.append(entry)
//        }
//
//        let chartDataSet = BarChartDataSet(entries: dataList, label: "wwwwww")
//        let chartData = BarChartData(dataSets: [chartDataSet])
//        chartData.barWidth = 0.5
//        barCharView.drawValueAboveBarEnabled = true
//        barCharView.dragEnabled = true // 启用拖拽
//        barCharView.scaleYEnabled = false
//        barCharView.doubleTapToZoomEnabled = false
//        barCharView.dragDecelerationEnabled = false
//        barCharView.xAxis.labelPosition = .bottom // x轴显示的位置
//        barCharView.xAxis.drawGridLinesEnabled = false // 不绘制网格
//        barCharView.leftAxis.drawGridLinesEnabled = false
//        barCharView.rightAxis.enabled = false
//        barCharView.data = chartData
    
    }
    
    func setData()
    {
        var xVals = [String]()
        for i in 0...60
        {
            xVals.append(NSString(format: "%d年", i+1993) as String)
        }
        //chartView.xAxis.valueFormatter = KMChartAxisValueFormatter.init(xValues as NSArray)
        
        
        
        var yVals = [BarChartDataEntry]()
        for j in 0...60
        {
            let val = (Double)(arc4random_uniform(40))

            yVals.append(BarChartDataEntry.init(x: Double(j), y: val))
        }
        
        //创建BarChartDataSet对象，其中包含有Y轴数据信息，以及可以设置柱形样式
        let set1 = BarChartDataSet(entries: yVals, label: "test")
        //set1.bar = 0.2  //柱形之间的间隙占整个柱形(柱形+间隙)的比例
        set1.drawValuesEnabled = true  //是否在柱形图上面显示数值
        set1.highlightEnabled = false  //点击选中柱形图是否有高亮效果，（双击空白处取消选中）
        set1.colors = ChartColorTemplates.material()
        
        
        //将BarChartDataSet对象放入数组中
        
        
        var dataSets = [BarChartDataSet]()

        
        dataSets.append(set1)
        
        //创建BarChartData对象, 此对象就是barChartView需要最终数据对象
        
//        self.barChartView.xAxis.valueFormatter = KMChartAxisValueFormatter.init(xVals as NSArray)
        
        let data:BarChartData = BarChartData(dataSets: dataSets)
        data.setValueFont(UIFont.init(name: "HelveticaNeue-Light", size: 10)!)  //文字字体
        data.setValueTextColor(UIColor.orange)  //文字颜色
        data.barWidth = 0.7
        
        //自定义数据显示格式
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        //formatter.positiveFormat = " $"
        self.barChartView.leftAxis.valueFormatter = DefaultAxisValueFormatter.init(formatter: formatter)
        
        
        self.barChartView.data = data
        self.barChartView.animate(xAxisDuration: 1)

    }
}

extension ViewController:ChartViewDelegate{
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
    }
}
