//
//  QuoteWidget.swift
//  QuoteWidget
//
//  Created by Manal alwayeli on 17/06/1444 AH.
//

import WidgetKit
import SwiftUI
//import Intents
//import QuoteService


struct Provider: TimelineProvider {
   // let quoteService: QuoteService
    //let quoteService: QuoteService
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct QuoteWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        
        ZStack{
            Image("treeleaves Background").resizable().opacity(0.8)
            Text("Nothing happens unless first we dream.").foregroundColor(.white)
                .font(Font.custom("Savoye LET", size: 20))
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
            Text("-Carl Sandburg").foregroundColor(.white)
                .font(Font.custom("Savoye LET", size: 20)).padding(.top,80)
            //Text(entry.date, style: .time)
        }
        
    }
}

struct QuoteWidget: Widget {
    let kind: String = "QuoteWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            QuoteWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct QuoteWidget_Previews: PreviewProvider {
    static var previews: some View {
        QuoteWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
