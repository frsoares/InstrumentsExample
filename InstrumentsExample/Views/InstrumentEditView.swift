//
//  InstrumentEditView.swift
//  InstrumentsExample
//
//  Created by Francisco Miranda Soares on 10/06/24.
//

import SwiftUI

struct InstrumentEditView: View {

    @Bindable var instrument: Instrument
    @Environment(InstrumentCatalog.self) private var catalog
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            TextField("The instrument's name", text: $instrument.name)
                .textContentType(.name)

            DatePicker(
                "Last maintained in:",
                selection: $instrument.lastMaintained,
                displayedComponents: .date
            )

            HStack {
                if !catalog.contains(instrument) {
                    Button("Save") {
                        catalog.add(instrument: instrument)
                        dismiss()
                    }
                }
                Spacer()
                Button("Close") { dismiss() }
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
    }
}

#Preview {
    InstrumentEditView(instrument: Instrument(name: "Bass"))
}
