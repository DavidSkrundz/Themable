# Themable

[![](https://img.shields.io/badge/Swift-5.0-orange.svg)][1]
[![](https://img.shields.io/badge/Xcode-12+-green.svg)][1]
[![](https://img.shields.io/badge/macOS-10.9+-blue.svg)][1]
[![](https://img.shields.io/badge/iOS-8+-blue.svg)][1]
[![](https://img.shields.io/badge/tvOS-9+-blue.svg)][1]
[![](https://img.shields.io/badge/watchOS-2+-blue.svg)][1]
[![](https://img.shields.io/badge/macCatalyst-13+-blue.svg)][1]

Create and apply Themes.

[1]: https://swift.org/download/#releases

1. Use `ThemeController` as the root VC

    - `ThemeController(viewController: UIViewController)`
    - Create a `ThemeSegue` with the identifier `"ThemeSegue"`

2. Create themes

 ```swift
let mainTheme = Theme(...)
let secondTheme = Theme(...)
```

3. Create and use a `ThemeContext`

 ```swift
let themeContext = ThemeContext(theme: mainTheme)
themeContext.controllers.append(themeController)
// Set every UIColor to the `themeContext.*` equivalent
```

4. Switch themes

 ```swift
self.themeContext.animateTheme(secondTheme)
```

### Subclassing `Theme` and `ThemeContext` to add more colors

```swift
class MyContext: ThemeContext {
	public var customColor: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.customColor.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.customColor
		}
	}
}
```

```swift
class MyTheme: Theme {
	public var customColor: UIColor
	
	public init(customColor: UIColor) {
		self.customColor = customColor
		super.init()
	}
}
```

