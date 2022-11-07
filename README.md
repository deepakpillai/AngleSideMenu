<p><h1 align="left">SwiftyUI Menu</h1></p>
<div><p><img align="right" src="https://github.com/deepakpillai/SwiftyUI-Menu/blob/main/SwiftyUIMenu.gif?raw=true" width="160" />
</p>
<p><h4>Easily & customizable menu for SwiftUI with SF Symbol support</h4></p>

___

# Usage

1. Drag and Drop Menu.swift into your project
2. Create a @State variable in you main view 
    ```swift
    @State var isMenuShown: Bool = false
    ```
3. Inside your main ZStack, add the below code 
    ```swift
    if isMenuShown {
        Menu(isMenuShown: $isMenuShown, menuItems: self.getMenuItems())
    }
    ```
4. Add the below set of parameters to your main view which is inside your main ZStack
    ```swift
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
    ```
5. Add the property to your main ZStack
    ```swift
    .onAppear {
        isMenuShown = false
    }
    ```

6. Add the below func in your SwiftUI file
    ```swift
    func toggleMenu() {
        withAnimation(.spring()) {
            self.isMenuShown.toggle()
        }
    }
    ```

7. Create an array of 'MenuItem' which we passed on to the Menu class in step 3 

    ```swift
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
    ```
    
With the above steps you will be able to add the SwiftyUI Menu to your application.

### UI Customization options
* <u>Text customization</u>
    * By making use of `text`, `textColor` & `textFont` property, you will be able to customize the menu item text

* <u>Icon customization</u>
    * Menu item with icon image
        * With custom icon image 
            * You can set your own custom image and manage its width and height and backgroundColor by using `iconImageName`, `iconImageWidth`, `iconImageHeight` & `iconImageBackgroundColor` properties
        * With SF Symbols 
            * You can make use of `sfIconName`, `sfIconForgroundColor`, `sfIconBackgroundColor` & `sfIconSize` properties to manage your icons
    * Menu item without icon image
        * You can set `noIconRequired: true` to remove image from the menu item

### Event control customization options
* <u>Navigating to different view</u> 
    * You can pass on the view instance to `destinationObject`. Make sure to cast your view to `AnyView` type before assigning the object.
    
* <u>Get tap event</u>
    * You can pass a closure to `didTap` property to get the tap event on a menu item.
  
## Example
1. Example to shows the usage of `didTap:` closure
    ```swift
    MenuItem(text: "Home", textColor: .white, sfIconName: "house.circle", sfIconForgroundColor: .white, didTap: {
    self.toggleMenu()
    })
    ```  
  
2. Example to shows the usage of `destinationObject:` property
    ```swift
    MenuItem(text: "Profile", textColor: .white, sfIconName: "person.crop.circle", sfIconForgroundColor: .white, destinationObject: AnyView(Profile()))
    ```
  
3. Example to show the menu item with no events
    ```swift
    MenuItem(text: "No event menu item", textColor: .white, iconImageName: "apple", iconImageWidth: 40.0, iconImageHeight: 40.0)
    ```
4. Example to show menu item without an image 
    ```swift
    MenuItem(text: "Menu item with no icon", textColor: .white, noIconRequired: true, destinationObject: AnyView(Settings()))
    ```

### Installation - Manually

Drop [Menu.swift](https://github.com/deepakpillai/SwiftyUI-Menu/blob/main/SwiftyUIMenu/Menu.swift) into your project.

<br>
<br>
<br>
