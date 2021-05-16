//
//  AVPlayerRepresented.swift
//  HomeDesign001
//
//  Created by 米国梁 on 2021/5/16.
//

import SwiftUI
import AVKit

struct AVPlayerRepresented: UIViewRepresentable {
    
    @Binding var player: AVPlayer
    
    let width, height: CGFloat
    
    func makeUIView(context: Context) -> some UIView {
        
        let layer = AVPlayerLayer(player: player)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        view.layer.addSublayer(layer)
        layer.frame = view.bounds
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
