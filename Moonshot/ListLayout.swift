//
//  ListLayout.swift
//  Moonshot
//
//  Created by Masoud Safari on 2024-03-03.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    //    let columns = [
    //        GridItem(.adaptive(minimum: 150))
    //    ]
    
    var body: some View {
        ScrollView {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        HStack {
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            .padding(.horizontal, 50)
                            
                            Spacer()
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding(.horizontal, 50)
                    }
                    .background(.lightBackground)
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                    .padding(.horizontal, 20)
                }
            }
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return ListLayout(astronauts: astronauts, missions: missions)
        .preferredColorScheme(.dark)
}
