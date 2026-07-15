//
//  ContentView.swift
//  SwiftUI-FoodDelivery
//
//  Created by Pradeep Kumar Sagar on 15/07/26.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue]
    @State private var currentPage = 0
    
    var body: some View {
        
        NavigationView {
            VStack{
                HStack{
                    Image("logo")
                        .resizable()
                        .frame(width: 80, height: 80)
                    //.padding(.bottom, 100)
                        .clipShape(Circle())
                        .padding()
                    
                    Spacer()
                }
                Image("background")
                    .resizable()
                //.scaledToFit()
                    .scaledToFill()
                    .frame(width: 300, height:300)
                    .clipShape(Circle())
                
                ZStack(alignment: .top){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                       // .frame(width: 300, height:300)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 10, y: 10)
                    
                    HStack(spacing: 10) {
                        ForEach(colors.indices, id: \.self) { index in
                            if index == currentPage {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.green)
                                    .frame(width: 20, height: 10)
                            }
                            else{
                                Circle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 10, height: 10)
                            }
                        }
                    }
                    .padding()
                    
                    ScrollView(.horizontal){
                        HStack(spacing: 0) {
                            
                            ForEach(colors.indices, id: \.self) { index in
                                Text("\(index)")
                                    .frame(width: 300)
                            }
                        }
                    }
                    .frame(height: 200)
                }
                .padding([.leading, .trailing], 30)
                .padding(.bottom, 60)
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .background(LinearGradient(colors: [Color("bgUpper"),Color("bgMiddle") ,Color("bgLower")], startPoint: .top, endPoint: .bottom))
        }
    }
}

#Preview {
    ContentView()
}
