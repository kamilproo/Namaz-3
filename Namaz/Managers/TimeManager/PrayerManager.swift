//
//  TimeManager.swift
//  Namaz
//

import Foundation
import Adhan

final public class PrayerManager {
    
    @Published public private (set) var nextPray: Prayer? = nil
    public private (set) var prayers: [Prayer] = []
    
    private var timer: Timer?
    
    static let shared = PrayerManager()
    
    private init() { }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    public func configure(prayers: [Prayer], timeInterval: TimeInterval = 1) {
        self.prayers = prayers
        
        timer?.invalidate()
        
        guard !prayers.isEmpty else { return }
        
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: { [weak self] (timer) in
            guard let nearestPrayer = self?.prayers.nearest else { return }
            self?.nextPray = nearestPrayer
        })
    }
}


