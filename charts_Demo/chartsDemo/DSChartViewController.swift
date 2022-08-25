//
//  DSChartViewController.swift
//  chartsDemo
//
//  Created by zc_mc on 2022/7/27.
//

import UIKit

class DSChartViewController: UIViewController {

    @IBOutlet weak var chartTableView: UITableView!{
        didSet{
            chartTableView.delegate = self
            chartTableView.dataSource = self
            chartTableView.separatorStyle = .none
            chartTableView.register(UINib.init(nibName: "DSLineChartTableViewCell", bundle: nibBundle), forCellReuseIdentifier: "DSLineChartTableViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func initChartView(){
        
    }
 
}
extension DSChartViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chartCell = tableView.dequeueReusableCell(withIdentifier: "DSLineChartTableViewCell", for: indexPath)
        return chartCell
    }
}
