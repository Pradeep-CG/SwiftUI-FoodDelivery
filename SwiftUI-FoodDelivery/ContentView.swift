//
//  ContentView.swift
//  SwiftUI-FoodDelivery
//
//  Created by Pradeep Kumar Sagar on 15/07/26.
//

import SwiftUI
import Combine

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue]
    @State private var currentPage = 0
    @State var width = 0.0
    @State private var currentIndex: Int?
    @State private var isWhite: Bool = true
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    let timer1 = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State private var isBlinking: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack{
                HStack{
                    if isWhite {
                        Spacer()
                    }
                    Image("logo")
                        .resizable()
                        .frame(width: 80, height: 80)
                    //.padding(.bottom, 100)
                        .clipShape(Circle())
                        .padding()
                        .rotationEffect(.degrees(isWhite ? 360 : 0))
                    if !isWhite {
                        Spacer()
                    }
                }
                //.background(Color.yellow)
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
                        .background(
                            GeometryReader { geo in
                                Color.clear
                                    .onAppear {
                                        width = geo.size.width
                                        print("width: \(width)")
                                    }
                                    .onChange(of: geo.size.width) { newWidth, oldWidth in
                                        //width = newWidth
                                    }
                            }
                        )
                    
                    
                    VStack(spacing: 20){
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
                                    
                                    if index == 0{
                                        view1
                                            .id(index)
                                    }
                                    if index == 1{
                                        view2
                                            .id(index)
                                    }
                                    if index == 2{
                                        view3
                                            .id(index)
                                    }
                                }
                            }
                            .frame(height: 200)
                            .scrollTargetLayout()
                        }
                        .frame(height: 200)
                        //.background(Color.gray)
                        .scrollPosition(id: $currentIndex)
                        .onChange(of: currentIndex) { newValue, oldValue in
                            print("Current Index:", newValue ?? 0)
                            currentPage = currentIndex ?? 0
                        }
                        .scrollTargetBehavior(.paging)
                        .scrollPosition(id: $currentIndex)
                        
                        Button("      Get Started      ") {
                            
                        }
                        .padding()
                        .foregroundColor(isWhite ? Color.white : Color.white)
                        .font(.title)
                        //.font(isBlinking ? .title : .caption)
                        .bold()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                //.fill(Color("bgUpper"))
                                .fill(isWhite ? Color.green : Color.orange)
                                .stroke(isBlinking ? Color.black : Color.green, lineWidth: 1)
                    
                                .shadow(color: isBlinking ? .black.opacity(0.4) : .clear, radius: 10, x: 10, y: 10)
                        )
                        .onReceive(timer) { _ in
                            withAnimation(.easeInOut(duration: 1)){
                                isWhite.toggle()
                            }
                        }
                        .onReceive(timer1) { _ in
                            withAnimation(.easeInOut(duration: 0.5)){
                                isBlinking.toggle()
                            }
                        }
                    }
                }
                .padding([.leading, .trailing], 30)
                .padding(.bottom, 20)
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .background(LinearGradient(colors: [Color("bgUpper"),Color("bgMiddle") ,Color("bgLower")], startPoint: .top, endPoint: .bottom))
        }
    }
    
    var view1: some View{
        VStack(alignment: .center, spacing: 15){
            Text("Quick delivery at your")
                .foregroundColor(.primary)
                .font(.largeTitle)
            
            Text("Doorstep")
                .foregroundColor(.orange)
                .fontWeight(.bold)
                .font(.largeTitle)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Purus et diam faucibus")
            
        }
        .frame(width: width, height: 200)
    }
    var view2: some View{
        VStack(alignment: .center, spacing: 15){
            Text("Notification at your")
                .foregroundColor(.primary)
                .font(.largeTitle)
            
            Text("Mobile")
                .foregroundColor(.orange)
                .fontWeight(.bold)
                .font(.largeTitle)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Purus et diam faucibus")
            
        }
        .frame(width: width, height: 200)
    }
    var view3: some View{
        VStack(alignment: .center, spacing: 15){
            Text("Detail receipt at your")
                .foregroundColor(.primary)
                .font(.largeTitle)
            
            Text("Email")
                .foregroundColor(.orange)
                .fontWeight(.bold)
                .font(.largeTitle)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Purus et diam faucibus")
            
        }
        .frame(width: width, height: 200)
    }
}
#Preview {
    ContentView()
}
