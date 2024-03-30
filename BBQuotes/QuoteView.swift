//
//  QuoteView.swift
//  BBQuotes
//
//  Created by Ruben Movsisyan on 3/26/24.
//

import SwiftUI

struct QuoteView: View {
    @StateObject private var viewModel = ViewModel(controller: FetchController())
    let show: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(show.lowerNoSpaces)
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                
                VStack {
                    VStack {
                        Spacer(minLength: 140)
                        
                        switch viewModel.status {
                        case .fetching:
                            ProgressView()
                        case .success(let data):
                            Text("\"\(data.quote.quote)\"")
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding()
                                .background(.black.opacity(0.5))
                                .clipShape(.capsule)
                                .padding(.horizontal)
                            
                            ZStack(alignment: .bottom) {
                                AsyncImage(url: data.character.images.first!) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                                
                                
                                Text(data.character.name)
                                    .foregroundStyle(.white)
                                    .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .background(.ultraThinMaterial)
                            }
                            .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                            .cornerRadius(80)
                        default:
                            EmptyView()
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        Task {
                            await viewModel.getData(for: show)
                        }
                    } label: {
                        Text("Get Random Qoute")
                            .font(.title)
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color("\(show.noSpaces)Button"))
                            .clipShape(.capsule)
                            .shadow(color:Color("\(show.noSpaces)Shadow") , radius: 2)
                    }
                    
                    Spacer(minLength: 180)
                }
                .frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView(show: Constants.bbName)
        .preferredColorScheme(.dark)
}
