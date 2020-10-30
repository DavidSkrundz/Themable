//
//  ThemeContext.swift
//  Themable
//

#if !os(macOS) && !os(watchOS)

import Color
import UIKit

open class ThemeContext: NSObject {
	public private(set) var currentTheme: Theme
	
	public var label: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.label.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.label
		}
	}
	public var secondaryLabel: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.secondaryLabel.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.secondaryLabel
		}
	}
	public var tertiaryLabel: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.tertiaryLabel.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.tertiaryLabel
		}
	}
	public var quaternaryLabel: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.quaternaryLabel.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.quaternaryLabel
		}
	}
	
	public var link: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.link.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.link
		}
	}
	
	public var placeholderText: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.placeholderText.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.placeholderText
		}
	}
	
	public var separator: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.separator.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.separator
		}
	}
	public var opaqueSeparator: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.opaqueSeparator.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.opaqueSeparator
		}
	}
	
	#if !os(tvOS)
	public var systemBackground: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.systemBackground.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.systemBackground
		}
	}
	public var secondarySystemBackground: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.secondarySystemBackground.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.secondarySystemBackground
		}
	}
	public var tertiarySystemBackground: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.tertiarySystemBackground.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.tertiarySystemBackground
		}
	}
	
	public var systemGroupedBackground: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.systemGroupedBackground.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.systemGroupedBackground
		}
	}
	public var secondarySystemGroupedBackground: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.secondarySystemGroupedBackground.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.secondarySystemGroupedBackground
		}
	}
	public var tertiarySystemGroupedBackground: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.tertiarySystemGroupedBackground.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.tertiarySystemGroupedBackground
		}
	}
	
	public var systemFill: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.systemFill.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.systemFill
		}
	}
	public var secondarySystemFill: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.secondarySystemFill.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.secondarySystemFill
		}
	}
	public var tertiarySystemFill: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.tertiarySystemFill.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.tertiarySystemFill
		}
	}
	public var quaternarySystemFill: UIColor {
		if #available(iOS 13.0, tvOS 13.0, *) {
			return Color.make { traitCollection -> UIColor in
				return self.currentTheme.quaternarySystemFill.resolvedColor(with: traitCollection)
			}
		} else {
			return self.currentTheme.quaternarySystemFill
		}
	}
	#endif
	
	public var controllers = [ThemeController]()
	
	public init(theme: Theme = .default) {
		self.currentTheme = theme
	}
	
	@available(iOS 12.0, tvOS 10.0, *)
	public func animateTheme(_ theme: Theme, duration: Double = 0.25) {
		self.currentTheme = theme
		for controller in self.controllers {
			guard let window = controller.view.window else { continue }
			let currentStyle = controller.traitCollection.userInterfaceStyle
			UIView.transition(
				with: window,
				duration: duration,
				options: .transitionCrossDissolve,
				animations: {
					Color.wantedTraits = Color.wantedTraits.with(currentStyle)
					controller.setUserInterfaceStyle(currentStyle == .light ? .dark : .light)
				}, completion: { _ in
					Color.wantedTraits = Color.wantedTraits.with(UIUserInterfaceStyle.unspecified)
					controller.setUserInterfaceStyle(.unspecified)
				})
		}
	}
}

#endif
