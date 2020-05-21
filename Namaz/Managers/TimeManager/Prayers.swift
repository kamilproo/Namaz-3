//
//  Prayers.swift
//  Namaz
//

import Foundation
import Adhan

public enum Prayer {
    
    case fajr(Date)
    case sunrise(Date)
    case dhuhr(Date)
    case asr(Date)
    case maghrib(Date)
    case isha(Date)
    
    var date: Date {
        switch self {
        case .fajr(let date): 	    return date
        case .sunrise(let date):    return date
        case .dhuhr(let date):      return date
        case .asr(let date):        return date
        case .maghrib(let date):    return date
        case .isha(let date):       return date
        }
    }
    
    var name: String {
        switch self {
        case .fajr:     return "Фаджр"
        case .sunrise:  return "Шурух"
        case .dhuhr:    return "Зухр"
        case .asr:      return "Аср"
        case .maghrib:  return "Магриб"
        case .isha:     return "Иша"
        }
    }
    var pray: String {
        switch self {
        case .fajr:     return "Фаджр - \(format: .HHmm, date: date)"
        case .sunrise:  return "Фаджр - \(format: .HHmm, date: date)"
        case .dhuhr:    return "Фаджр - \(format: .HHmm, date: date)"
        case .asr:      return "Фаджр - \(format: .HHmm, date: date)"
        case .maghrib:  return "Фаджр - \(format: .HHmm, date: date)"
        case .isha:     return "Фаджр - \(format: .HHmm, date: date)"
        }
    }
    
}





extension Prayer {
    
    static func make(players: PrayerTimes) -> [Prayer] {
        return [.fajr(players.fajr), .sunrise(players.sunrise),
         .dhuhr(players.dhuhr), .asr(players.asr),
         .maghrib(players.maghrib), .isha(players.isha)]
    }
}


extension Array where Element == Prayer {
    var nearest: Element? {
        self.first(where: { $0.date > Date() })
    }
}



