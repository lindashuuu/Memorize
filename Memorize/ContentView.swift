//
//  ContentView.swift
//  Memorize
//
//  Created by linda shu on 9/10/21.
//

import SwiftUI

struct ContentView: View {
    var emojis: [String] = ["🚁", "🛩", "🚢","✈️","🚑","🚀","🚞","🚚","🚗","🛴", "🛶", "🚖", "🦽", "🚊"]
    @State var emojiCount = 6
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]
                ){
                    ForEach(emojis[0..<emojiCount], id: \.self, content: {
                        emoji in CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                    
                }.padding(.horizontal)
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
        }
    }
    
    var remove: some View {
        Button {
            if emojiCount>1 {
                emojiCount-=1
            }
            
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button{
            if emojiCount<emojis.count {
                emojiCount+=1
            }
            
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    
}

struct CardView: View{
    var content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                
                Text(content).font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.light)
        }
        ContentView()
            .preferredColorScheme(.dark)
        
    }
}
