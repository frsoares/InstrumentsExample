//
//  InstrumentCatalog.swift
//  InstrumentsExample
//
//  Created by Francisco Miranda Soares on 10/06/24.
//

import Foundation

@Observable final class InstrumentCatalog {

    var instruments: [Instrument] = []

    func contains(_ instrument: Instrument) -> Bool {
        return instruments.contains(instrument)
    }

    func add(instrument: Instrument) {
        instruments.append(instrument)
    }
}
