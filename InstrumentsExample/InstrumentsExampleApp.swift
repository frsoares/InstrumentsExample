//
//  InstrumentsExampleApp.swift
//  InstrumentsExample
//
//  Created by Francisco Miranda Soares on 10/06/24.
//

import SwiftUI

@main
struct InstrumentsExampleApp: App {

    @State private var catalog = InstrumentCatalog()

    var body: some Scene {
        WindowGroup {
            InstrumentCatalogView()
        }
        .environment(catalog)
    }
}
