//
//  InstrumentView.swift
//  InstrumentsExample
//
//  Created by Francisco Miranda Soares on 10/06/24.
//

import SwiftUI

struct InstrumentView: View {

    var instrument: Instrument
    @State private var isEditorPresented = false

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(instrument.name)
                Text("Last maintained: \(instrument.lastMaintained, format: .dateTime.day().month().year())")
                    .font(.caption)
            }
            Spacer()
            Button("Edit") { isEditorPresented.toggle() }
        }
        .sheet(isPresented: $isEditorPresented) {
            InstrumentEditView(instrument: instrument)
                .presentationDetents([.fraction(0.2)])
        }
    }
}

#Preview {
    InstrumentView(instrument: Instrument(name: "Guitar"))
}
