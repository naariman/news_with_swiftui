//
//  ItemView.swift
//  job_search
//
//  Created by Nariman on 24.12.2023.
//

import SwiftUI

struct ItemView: View {
    private let title: String
    private let imageURLPath: String
    private let date: String
    private let sourceTitle: String
    private let dateFormatter = DateFormatter()
    
    init(
        title: String,
        imageURLPath: String,
        date: String,
        sourceTitle: String
    ) {
        self.title = title
        self.imageURLPath = imageURLPath
        self.date = date
        self.sourceTitle = sourceTitle
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: imageURLPath)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .padding(30)
                    case .failure(_):
                        Image(.notFound404)
                            .resizable()
                            .cornerRadius(12)
                    case .success(let image):
                        image
                            .resizable()
                            .cornerRadius(12)
                            .padding(8)
                    @unknown default:
                        ProgressView()
                            .padding(30)
                    }
                }
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height / 2
                )
                
                Text(title)
                    .padding(.init(top: 0, leading: 8, bottom: 0, trailing: 8))
                    .font(.system(.caption))
                    .lineLimit(2)
                    .bold()
                    
                Text(sourceTitle)
                    .font(.system(size: 10))
                    .padding(.init(top: 4, leading: 14, bottom: 4, trailing: 14))
                    .foregroundStyle(.white)
                    .background(.black)
                    .border(.black, width: 1)
                    .cornerRadius(8)
                    .padding(.init(top: 0, leading: 8, bottom: 0, trailing: 8))
                HStack {
                    Image(systemName: "calendar.circle")
                    Text(date)
                        .font(.system(size: 12))
                    Spacer()
                }
                .foregroundStyle(Color.gray)
                .padding(.init(top: 0, leading: 8, bottom: 8, trailing: 8))
            }
            .background(.white)
            .cornerRadius(12)
            
        }
    }
}


