import SwiftUI


struct ContentView: View {
    @State var tags: [Tag] = rawTags.compactMap { tag -> Tag? in
        return .init(name: tag)

    }
    var body: some View {
        NavigationStack {
            VStack {
                TagView(aligment: .center, spacing: 10) {
                    ForEach($tags) { $tag in
                        Toggle(tag.name, isOn: $tag.isSelected).toggleStyle(.button).buttonStyle(.bordered).tint(.red)
                    }

                }



            }.padding(15).navigationTitle(Text("Layouts"))
        }
    }
}

struct TagView: Layout {
    var aligment: Alignment = .center
    var spacing: CGFloat = 10

    init(aligment: Alignment, spacing: CGFloat) {
        self.aligment = aligment
        self.spacing = spacing
    }


    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return .init(width: proposal.width ?? 0, height: proposal.height ?? 0)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        
        
        var origin = bounds.origin
        var maxWidth = bounds.width
        
        subviews.forEach { view in
            let viewSize = view.sizeThatFits(proposal)
            view.place(at: origin, proposal: proposal)
            origin.x += (viewSize.width + spacing)
        }

    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

var rawTags: [String] = [

    "SwiftUI",
    "Xcode",
    "Flutter",
    "Android Studio",
    "iOS",
    "Dart",
    "macOS",
    "API",
    "Apple",
    "Android",

]

struct Tag: Identifiable {
    var id = UUID().uuidString
    var name: String
    var isSelected: Bool = false
}
