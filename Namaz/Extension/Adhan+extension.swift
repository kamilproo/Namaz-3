//
//  Adhan+extension.swift
//  Namaz
//
//  Copyright © 2020 Камиль Зиязетдинов. All rights reserved.
//

import Foundation
import Adhan
import CoreLocation

extension PrayerTimes {
    
    init?(coordinates: CLLocationCoordinate2D) {
        
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let components = calendar.dateComponents([.year, .month, .day], from: Date())
        
        var params = CalculationMethod.moonsightingCommittee.params
        params.madhab = .hanafi
        
        self.init(
            coordinates: .init(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude),
            date: components,
            calculationParameters: params)
    }
}
