//
//  ForecastDayTableViewCell.swift
//  Forecast
//
//  Created by Apple on 11/10/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ForecastDayTableViewCell: UITableViewCell {

    @IBOutlet weak var skyImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var WindSpeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    var cellViewModel: ForecastDayCellViewModel? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell() {
        
        dayLabel.text = cellViewModel?.dayText
        descriptionLabel.text = cellViewModel?.descriptionText
        tempLabel.text = cellViewModel?.tempText
        WindSpeedLabel.text = cellViewModel?.windSpeedText
        humidityLabel.text = cellViewModel?.humidityText
        skyImage.setImage(cellViewModel?.weatherImageURLString)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
