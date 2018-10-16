//
//  ForecastViewController.swift
//  Forecast
//
//  Created by Apple on 11/10/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = ForecastViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewModel.getAPIData { [weak self] (data) in
            guard let strongSelf = self else {
                return
            }
            guard let data = data else {
                strongSelf.showErrorAlert(strongSelf.viewModel.errorMessage)
                return
            }
            DispatchQueue.main.async {
                strongSelf.updateMapView(data)
            }
        }
    }
    
    func showErrorAlert(_ errorMessage: String? = "Data Error") {
        
    }
    
    func updateMapView(_ forecastData: ForecastModel) {
        tableView.reloadData()
    }
    
    //Mark: - TableView Delegate and DataSource Method
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.lists?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell", for: indexPath) as? ForecastDayTableViewCell else {
            return UITableViewCell()
        }
        if let lists = viewModel.lists {
            let list = lists[indexPath.row]
            cell.cellViewModel = ForecastDayCellViewModel()
            cell.cellViewModel?.list = list
            cell.configureCell()
        }
        return cell
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
