//
//  Menu.swift
//  AngleSideMenu
//
//  Created by Deepak on 07/11/22.
//

import SwiftUI

struct Menu: View {
    @Binding var isMenuShown: Bool
    var menuItems: [MenuItem] = []
    var profileName: String = ""
    var profileImage: UIImage?
    var footerText: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.orange, .purple], startPoint: .top, endPoint: .bottom)
            VStack {
                Spacer()
                    .frame(height: 100)
                HStack {
                    VStack {
                        if let image = profileImage {
                            Image(uiImage: image).resizable().frame(width: 150, height: 150, alignment: .center)
                        } else {
                            Image(systemName: "face.smiling").resizable().frame(width: 150, height: 150, alignment: .center)
                        }
                        
                        Text(profileName).bold().foregroundColor(.white).font(.system(size: 30))
                        Divider().frame(width: 120)
                    }
                    Spacer()
                }
                Spacer()
                    .frame(height: 20)
                HStack {
                    ScrollView {
                        VStack {
                            ForEach(menuItems, id: \.id) { item in
                                item
                            }
                        }
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Text(footerText)
                        .foregroundColor(.white)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                    Spacer().frame(width: 100)
                }

                Spacer()
                    .frame(height: 20)
            }
            .padding([.leading], 20)
        }.ignoresSafeArea()
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu(isMenuShown: .constant(false))
    }
}

struct MenuItem: View {
    var id = UUID()
    @State var text: String = "Home"
    @State var textColor: Color = .white
    @State var textFont = Font.system(size: 20)
    //Pass in your custome icon image name in iconImageName
    @State var iconImageName: String? = nil
    //Pass in your custome icon width in iconImageWidth
    @State var iconImageWidth: CGFloat = 35.0
    //Pass in your custome icon height in iconImageHeight
    @State var iconImageHeight: CGFloat = 35.0
    //Pass in your custome icon background color in iconImageBackgroundColor
    @State var iconImageBackgroundColor: Color = .clear
    //If you are using SF symbol, you can passin the SF Symbol name in iconName param
    @State var sfIconName: String = "photo.circle"
    //You can set the forground color of the image if you are using SF Symbol
    @State var sfIconForgroundColor: Color = .black
    //You can set the background color of the image if you are using SF Symbol
    @State var sfIconBackgroundColor: Color = .clear
    //You can set the size of the icon image if you are using SF Symbol
    @State var sfIconSize: CGFloat = 30.0
    //Set noIconRequired to true if you dont want icon images in menu
    @State var noIconRequired: Bool = false
    //Pass in destination view instance in destinationObject
    @State var destinationObject: AnyView? = nil
    //Pass in a closure if you cant to get the tap event call-back
    @State var didTap: (()->())? = nil
    
    var body: some View {
        HStack {
            if didTap != nil {
                Button {
                    (didTap ?? {})()
                } label: {
                    HStack {
                        MenuElements(text: $text, textColor: $textColor, textFont: $textFont, iconImageName: $iconImageName, iconImageWidth: $iconImageWidth, iconImageHeight: $iconImageHeight, iconImageBackgroundColor: $iconImageBackgroundColor, sfIconName: $sfIconName, sfIconForgroundColor: $sfIconForgroundColor, sfIconBackgroundColor: $sfIconBackgroundColor, sfIconSize: $sfIconSize, noIconRequired: $noIconRequired)
                    }
                }.frame(width: 300, height: 40, alignment: .leading)
            } else if destinationObject != nil {
                NavigationLink {
                    destinationObject
                } label: {
                    HStack {
                        MenuElements(text: $text, textColor: $textColor, textFont: $textFont, iconImageName: $iconImageName, iconImageWidth: $iconImageWidth, iconImageHeight: $iconImageHeight, iconImageBackgroundColor: $iconImageBackgroundColor, sfIconName: $sfIconName, sfIconForgroundColor: $sfIconForgroundColor, sfIconBackgroundColor: $sfIconBackgroundColor, sfIconSize: $sfIconSize, noIconRequired: $noIconRequired)
                    }
                }.frame(width: 300, height: 40, alignment: .leading)
            } else {
                HStack {
                    MenuElements(text: $text, textColor: $textColor, textFont: $textFont, iconImageName: $iconImageName, iconImageWidth: $iconImageWidth, iconImageHeight: $iconImageHeight, iconImageBackgroundColor: $iconImageBackgroundColor, sfIconName: $sfIconName, sfIconForgroundColor: $sfIconForgroundColor, sfIconBackgroundColor: $sfIconBackgroundColor, sfIconSize: $sfIconSize, noIconRequired: $noIconRequired)
                }.frame(width: 300, height: 40, alignment: .leading)
            }
        }
    }
}

struct MenuElements: View {
    
    @Binding var text: String
    @Binding var textColor: Color
    @Binding var textFont: Font
    @Binding var iconImageName: String?
    @Binding var iconImageWidth: CGFloat
    @Binding var iconImageHeight: CGFloat
    @Binding var iconImageBackgroundColor: Color
    @Binding var sfIconName: String
    @Binding var sfIconForgroundColor: Color
    @Binding var sfIconBackgroundColor: Color
    @Binding var sfIconSize: CGFloat
    @Binding var noIconRequired: Bool
    
    var body: some View {
        if !noIconRequired {
            if let _ = Binding($iconImageName) {
                Image(iconImageName!)
                    .resizable()
                    .background(iconImageBackgroundColor)
                    .frame(width: iconImageWidth, height: iconImageHeight, alignment: .leading)
            } else {
                Image(systemName: sfIconName)
                    .foregroundColor(sfIconForgroundColor)
                    .background(sfIconBackgroundColor)
                    .font(.system(size: sfIconSize))
            }
        }
        Text(text)
            .foregroundColor(textColor)
            .font(textFont)
            .lineLimit(1)
    }
}
