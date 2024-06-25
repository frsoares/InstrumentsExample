//
//  Instrument.swift
//  InstrumentsExample
//
//  Created by Francisco Miranda Soares on 10/06/24.
//

import Foundation

@Observable final class Instrument: Identifiable, Equatable {

    var name: String
    var lastMaintained: Date

    init(name: String, lastMantained: Date = .now) {
        self.name = name
        self.lastMaintained = lastMantained
    }

    static func == (lhs: Instrument, rhs: Instrument) -> Bool {
        return lhs === rhs
    }
}
