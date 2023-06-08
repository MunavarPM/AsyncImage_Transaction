//
//  ContentView.swift
//  AsycImage
//
//  Created by MUNAVAR PM on 08/06/23.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
        .resizable()
        .scaledToFit()
    }
    func iconModofier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.3)

        
    }
}

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        
/// It was like show image when the image get loading time.

//        AsyncImage(url: URL(string: imageURL)) { image in
//            image.imageModifier()
//
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").iconModofier()
//        }
//        .padding(30)
        
/// It was how we handle with error we section like different phases
      
//        AsyncImage(url: URL(string: imageURL)) { phase in
//            ///success phase
//            if let image = phase.image {
//                image.imageModifier()
//            /// failer phase
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fil").iconModofier()
//            /// No image loaded phase
//            } else {
//                Image(systemName: "photo.circle.fil").iconModofier()
//            }
//        }
//        .padding(40)
        
        
///  Another case for handle the phase using switch case ✨

        AsyncImage(url: URL(string: imageURL),transaction: Transaction(animation: .spring(response: 0.2,dampingFraction: 0.4,blendDuration: 0.25))) {
            phase in
            switch phase {
            case.success(let image): image.imageModifier().transition(.scale)
            case.failure(_): Image(systemName: "ant.circle.fill").iconModofier()
            case.empty: Image(systemName: "photo.circle.fill").iconModofier()
            }
            
        }
        
        .padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
