//
//  Home.swift
//  HomeDesign001
//
//  Created by 米国梁 on 2021/5/16.
//

import SwiftUI
import AVKit


class HomeModel: NSObject, ObservableObject {
    
    @Published var player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType: "mp4")!))
    
    override init() {
        super.init()
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd(notification:)), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: CMTime.zero, completionHandler: nil)
        }
    }
}

struct Home: View {
    
    @StateObject var data = HomeModel()
    
    var body: some View {
        
        GeometryReader { proxy in
            
            VStack(alignment: .leading, spacing: 30) {
                
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
                                                .shadow(color: Color.gray.opacity(0.3), radius: 5))
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
                                                .shadow(color: Color.gray.opacity(0.3), radius: 5))
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
                    
                    HStack(spacing: 20) {
                        
                        ForEach(array, id: \.self) { item in
                            
                                Image(item.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 200, alignment: .topLeading)
                                    .clipped()
                                    .overlay(VStack(alignment: .leading, spacing: 5) {
                                        
                                        Text(item.title)
                                            .font(.caption)
                                            .fontWeight(.semibold)
                                        
                                        HStack {
                                            
                                            Image(systemName: "clock")
                                            
                                            Text(item.duration)
                                            
                                            Spacer()
                                        }
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                    }
                                    .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    , alignment: .bottom)
                                
                            .cornerRadius(15)
                            .background(Color.white
                                            .cornerRadius(15)
                                            .shadow(color: Color.gray.opacity(0.3), radius: 5))
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                }
                .padding(.horizontal, -20)
            }
            .padding(20)
            .onAppear {
                data.player.play()
            }
            .overlay(Button(action:{}, label:{
                Image(systemName:"magnifyingglass")
                    .font(.title3)
                    .foregroundColor(.black)
            }).padding(), alignment: .topTrailing)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
