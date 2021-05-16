//
//  Home.swift
//  HomeDesign001
//
//  Created by 米国梁 on 2021/5/16.
//

import SwiftUI
import AVKit


class HomeModel: ObservableObject {
    @Published var player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType: "mp4")!))
}

struct Home: View {
    
    @StateObject var data = HomeModel()
    
    var body: some View {
        
        GeometryReader { proxy in
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Quick Help")
                    .fontWeight(.heavy)
                
                HStack {
                    
                    Button(action: {}, label: {
                        VStack {
                            Image("food")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(15)
                                .frame(maxWidth: 70, maxHeight: 70)
                                .background(Color.white
                                                .cornerRadius(15)
                                                .shadow(color: Color.gray.opacity(0.3), radius: 15))
                            Text("Foods")
                                .font(.footnote)
                                .foregroundColor(.black)
                        }
                    })
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        VStack {
                            Image("beach")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(15)
                                .frame(maxWidth: 70, maxHeight: 70)
                                .background(Color.white
                                                .cornerRadius(15)
                                                .shadow(color: Color.gray.opacity(0.3), radius: 15))
                            Text("Views")
                                .font(.footnote)
                                .foregroundColor(.black)
                        }
                    })
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        VStack {
                            Image("plane")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(15)
                                .frame(maxWidth: 70, maxHeight: 70)
                                .background(Color.white
                                                .cornerRadius(15)
                                                .shadow(color: Color.gray.opacity(0.3), radius: 15))
                            Text("Flights")
                                .font(.footnote)
                                .foregroundColor(.black)
                        }
                        
                    })
                    
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        VStack {
                            Image("entertainment")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(15)
                                .frame(maxWidth: 70, maxHeight: 70)
                                .background(Color.white
                                                .cornerRadius(15)
                                                .shadow(color: Color.gray.opacity(0.3), radius: 15))
                            Text("Games")
                                .font(.footnote)
                                .foregroundColor(.black)
                        }
                    })
                }
                
                Text("Daily Meditations")
                    .fontWeight(.heavy)
                
                AVPlayerRepresented(player: $data.player, width: proxy.size.width, height: proxy.size.width * 9 / 16)
                    .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.width * 9 / 16)
                    .cornerRadius(15)
                    .overlay(VStack(alignment: .leading, spacing: 5) {
                        
                        Text("Rest & Relex")
                            .fontWeight(.heavy)
                        
                        HStack {
                            
                            Image(systemName: "clock")
                            
                            Text("30 mins")
                        }
                        .font(.footnote)
                    }.padding(), alignment: .bottomLeading)
                    .shadow(color: Color.gray.opacity(0.3), radius: 15)
                
                HStack {
                    
                    Text("New Musics")
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    Button("View all") {}
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        
                    }
                }
            }
            .padding()
            .onAppear {
                data.player.play()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
