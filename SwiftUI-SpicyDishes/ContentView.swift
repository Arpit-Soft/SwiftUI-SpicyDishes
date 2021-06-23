//
//  ContentView.swift
//  SwiftUI-SpicyDishes
//
//  Created by Arpit Dixit on 23/06/21.
//

import SwiftUI

struct ContentView: View {
    let dishes = Dish.all()
    @State private var isSpicy = false
    var body: some View {
        VStack {
            Toggle(isOn: $isSpicy) {
                Text("Is Spicy")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.secondary)
            }
            .padding()
            List(dishes.filter({$0.isSpicy == isSpicy}), id: \.id) { dish in
                Image(dish.imageURL)
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Text(dish.name)
                    .font(.title)
                Spacer()
                if dish.isSpicy {
                    Image("spicy-icon")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
            }
            Button("Press To Switch") {
                isSpicy.toggle()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
