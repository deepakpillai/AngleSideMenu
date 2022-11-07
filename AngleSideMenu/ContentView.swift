//
//  ContentView.swift
//  AngleSideMenu
//
//  Created by Deepak on 07/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var isMenuShown: Bool = false
    @State var isUserLoggedIn: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                if isMenuShown {
                    Menu(isMenuShown: $isMenuShown, menuItems: self.getMenuItems(), profileName: "Deepak Pillai", profileImage: UIImage(named: "profileIcon"), footerText: "©Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.")
                }
                if isUserLoggedIn {
                    
                    HomeView()
                        .cornerRadius(isMenuShown ? 20 : 0)
                        .offset(x: isMenuShown ? 300 : 0, y: isMenuShown ? 50 : 0)
                        .rotationEffect(.init(degrees: isMenuShown ? -8 : 0))
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .ignoresSafeArea()
                        .scaleEffect(isMenuShown ? 0.9 : 1)
                        .navigationBarHidden(isMenuShown ? true : false)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -10, y: 10)
                        .toolbar{
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button{
                                    toggleMenu()
                                } label: {
                                    Image(systemName: "filemenu.and.selection")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18))
                                }
                            }
                        }
                        .onTapGesture {
                            if isMenuShown {
                                toggleMenu()
                            }
                        }
                } else {
                    VStack {
                        Text("User Logged out")
                        Button{
                            self.isUserLoggedIn = true
                        }label: {
                            Text("Login")
                        }
                    }.navigationBarHidden(true)
                }
            }
            .onAppear {
                isMenuShown = false
            }
        }
    }
    
    func toggleMenu() {
        withAnimation(.spring()) {
            self.isMenuShown.toggle()
        }
    }
    
    func logout() {
        self.isUserLoggedIn = false
    }
    
    func getMenuItems() -> [MenuItem] {
        
        let array = [
            MenuItem(text: "Home", textColor: .white, sfIconName: "house.circle", sfIconForgroundColor: .white, didTap: {
                self.toggleMenu()
            }),
            MenuItem(text: "Profile", textColor: .white, sfIconName: "person.crop.circle", sfIconForgroundColor: .white, destinationObject: AnyView(Profile())),
            MenuItem(text: "Logout", textColor: .white, sfIconName: "rectangle.portrait.and.arrow.right", sfIconForgroundColor: .white, didTap: {
                self.toggleMenu()
                self.logout()
            })
        ]
        
        return array
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Profile: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(.orange)
            Text("Profile")
                .bold()
                .font(.system(size: 30))
                .foregroundColor(.white)
        }
    }
}

struct Settings: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(.orange)
            Text("Settings")
                .bold()
                .font(.system(size: 30))
                .foregroundColor(.white)
        }
    }
}

struct Logout: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(.orange)
            Text("Logout")
                .bold()
                .font(.system(size: 30))
                .foregroundColor(.white)
        }
    }
}

struct HomeView: View {
    
    var body: some View {
        ZStack {
            Color(.white)
            VStack {
                Text("Hello World!")
            }
        }
    }
}
