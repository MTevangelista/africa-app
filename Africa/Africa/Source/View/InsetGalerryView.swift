import SwiftUI

struct InsetGalerryView: View {
    
    let animal: Animal
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }//: ForEach
            } //: HStack
        }//: ScrollView
    }
}

struct InsetGalerryView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGalerryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
