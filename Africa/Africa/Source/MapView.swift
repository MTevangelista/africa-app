import SwiftUI
import MapKit

struct MapView: View {
    let locaitons: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    var body: some View {
        // MARK: - No1 BASIC MAP
        //Map(coordinateRegion: $region)
        
        // MARK: - No2 ADVANCED MAP
        Map(coordinateRegion: $region, annotationItems: locaitons) { item in
            // (A) PIN: OLD STYLE (ALWAYS STATIC)
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            // (B) MARKER: NEW STYLE (ALWAYS STATIC)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) CUSTOM BASIC ANNOTATION (IT COULD BE INTERACTIVE)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }//: ANNOTATION
            
            // (D) CUSTOM BASIC ANNOTATION (IT COULD BE INTERACTIVE)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }//: ANNOTATION
        }//: Map
        .overlay(infoContainer, alignment: .top)
    }
    
    private var infoContainer: some View {
        HStack(alignment: .center, spacing: 12) {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            
            VStack(alignment: .leading, spacing: 3) {
                HStack {
                    Text("Latitude:")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text("\(region.center.latitude)")
                        .font(.footnote)
                        .foregroundColor(.white)
                }//: HStack
                
                Divider()
                
                HStack {
                    Text("Longitude:")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text("\(region.center.longitude)")
                        .font(.footnote)
                        .foregroundColor(.white)
                }//: HStack
            }//: VStack
        }//: HStack
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(Color.black.cornerRadius(8).opacity(0.6))
        .padding()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
