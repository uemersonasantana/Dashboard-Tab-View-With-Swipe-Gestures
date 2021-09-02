//
//  ContentView.swift
//  Dashboard Tab View With Swipe Gestures
//
//  Created by Uemerson A. Santana on 01/09/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var index = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("STAT")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Color"))
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            
            // Tab view
            HStack(spacing: 0) {
                Text("Day")
                    .foregroundColor(self.index == 0 ? .white : Color("Color").opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical,10)
                    .padding(.horizontal,35)
                    .background(Color("Color").opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 0
                        }
                    }
                
                Spacer(minLength: 0)
                
                Text("Week")
                    .foregroundColor(self.index == 1 ? .white : Color("Color").opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical,10)
                    .padding(.horizontal,35)
                    .background(Color("Color").opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 1
                        }
                    }
                
                Spacer(minLength: 0)
                
                Text("Month")
                    .foregroundColor(self.index == 2 ? .white : Color("Color").opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical,10)
                    .padding(.horizontal,35)
                    .background(Color("Color").opacity(self.index == 2 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 2
                        }
                    }
            }
            .background(Color.black.opacity(0.06))
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.top,25)
            
            // Dashboard grid
            
            
            // Connecting index with tabview for tab change
            
            // Tab view with swipe gestures
            TabView(selection: self.$index) {
                // Week data
                GridView(fitness_Data: fit_Data)
                    .tag(0)
                
                // Month data
                GridView(fitness_Data: week_Fit_Data)
                    .tag(1)
                
                VStack {
                    Text("Monthly Data")
                }
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Spacer(minLength: 0)
        }
        .padding(.top)
    }
}

struct GridView: View {
    var fitness_Data: [Fitness]
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(fitness_Data){fitness in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(fitness.title)
                            .foregroundColor(.white)
                        
                        Text(fitness.data)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,10)
                        
                        HStack {
                            Spacer(minLength: 0)
                            
                            Text(fitness.suggest)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    // image name same as color name
                    .background(Color(fitness.image))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    // Top image
                    Image(systemName: fitness.icone)
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.35))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                }
            }
        }
        .padding(.horizontal)
        .padding(.top,25)
    }
}

// Dasboard grid model data
struct Fitness: Identifiable {
    var id: Int
    var title: String
    var image: String
    var data: String
    var suggest: String
    var icone: String
}

var fit_Data = [
    Fitness(id: 0, title: "Heart Rate", image: "heart", data: "123 bpm", suggest: "80-120\nHealthy", icone: "suit.heart.fill")
    ,Fitness(id: 1, title: "Ci Rate", image: "yellow", data: "123 bpm", suggest: "80-120\nHealthy", icone: "bicycle")
    ,Fitness(id: 2, title: "Ga Rate", image: "blue", data: "123 bpm", suggest: "80-120\nHealthy", icone: "cart.fill")
    ,Fitness(id: 3, title: "Iooo Rate", image: "marron", data: "123 bpm", suggest: "80-120\nHealthy", icone: "externaldrive")
    ,Fitness(id: 4, title: "Cis Rate", image: "gray", data: "123 bpm", suggest: "80-120\nHealthy", icone: "hammer")
]

// Monthly Data

var week_Fit_Data = [
    Fitness(id: 0, title: "Blabla Rate", image: "gray", data: "84 bpm", suggest: "80-120\nHealthy", icone: "")
    ,Fitness(id: 1, title: "Tuitui Rate", image: "blue", data: "123 bpm", suggest: "80-120\nHealthy", icone: "cart.fill")
    ,Fitness(id: 2, title: "Papa Rate", image: "marron", data: "123 bpm", suggest: "80-120\nHealthy", icone: "externaldrive")
    ,Fitness(id: 3, title: "Bebe Rate", image: "blue", data: "123 bpm", suggest: "80-120\nHealthy", icone: "hammer")
]
