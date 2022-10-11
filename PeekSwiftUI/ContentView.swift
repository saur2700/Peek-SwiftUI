//
//  ContentView.swift
//  PeekSwiftUI
//
//  Created by Saurav  Kumar on 19/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentIndex: Int = 0
    @State var colors: [ColorView] = []
    
    var body: some View {
        VStack() {
            Text("\(currentIndex)")
            PeekView(index: $currentIndex, items: colors) { colour in
                
                GeometryReader{image in
                    
                    let size = image.size
                    
                    Image(colour.ColorImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .cornerRadius(12)
                }
            }
            .padding(.vertical,40)
            
        }
        .onAppear {
            for index in 1...3{
                colors.append(ColorView(ColorImage: "Color\(index)"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
