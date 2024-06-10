//
//  InstrumentCatalogView.swift
//  InstrumentsExample
//
//  Created by Francisco Miranda Soares on 10/06/24.
//

import SwiftUI

struct InstrumentCatalogView: View {

    @Environment(InstrumentCatalog.self) private var catalog
    @State private var removedInstrument: Instrument?
    @State private var isPresentingRemovedAlert = false
    @State private var newInstrument: Instrument?

    var body: some View {
        List {
            Section("Add instrument") {
                Button("Add") {
                    newInstrument = Instrument(name: "")
                }
            }

            Section("Instruments") {
                ForEach(catalog.instruments) { instrument in
                    InstrumentView(instrument: instrument)
                }
                .onDelete(perform: delete)
            }
        }
        .alert("Removed instrument",
               isPresented: $isPresentingRemovedAlert,
               presenting: removedInstrument,
               actions: { _ in Button("OK", action: {})},
               message: { instrument in
            Text("\(instrument.name) was removed from your catalog!")
        })
        .sheet(item: $newInstrument) { instrument in
            InstrumentEditView(instrument: instrument)
                .presentationDetents([.fraction(0.2)])
        }
    }
}

extension InstrumentCatalogView {
    func delete(at indexes: IndexSet) {
        for index in indexes {
            let instrument = catalog.instruments.remove(at: index)
            self.removedInstrument = instrument
            self.isPresentingRemovedAlert = true
        }
    }
}

#Preview {
    InstrumentCatalogView()
}
