import SwiftUI

struct AnimalDetailView: View {
    // MARK: - PROPERTIES
    
    let animal: Animal
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 20)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // GALLERY
                Group {
                    HeadingView(image: "photo.on.rectangle.angled", text: "Wilderness in Pictures")
                    InsetGalerryView(animal: animal)
                }
                .padding(.horizontal)
                
                // FACTS
                Group {
                    HeadingView(image: "questionmark.circle", text: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                // DESCRIPTION
                Group {
                    HeadingView(image: "info.circle", text: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                    
                }
                .padding(.horizontal)
                
                // MAP
                Group {
                    HeadingView(image: "map", text: "National Parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                // LINK
                Group {
                    HeadingView(image: "books.vertical", text: "Learn More")
                    ExternalWeblinkView(animal: animal)
                }
                .padding(.horizontal)
                
            } //: VSTACK
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        } //: SCROLL VIEW
    } //: BODY
}

// MARK: - PREVIEW

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
    }
}
