//
//  ThemeController.swift
//  Themable
//

#if !os(macOS) && !os(watchOS)

import TraitCollection
import UIKit

open class ThemeController: UIViewController {
	final public private(set) var overrideTraits = UITraitCollection()
	final public private(set) var rootViewController: UIViewController?
	
	required public init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	public init(viewController: UIViewController) {
		super.init(nibName: nil, bundle: nil)
		self.setRootViewController(viewController)
	}
	
	open override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		if self.rootViewController == nil {
			self.performSegue(withIdentifier: "ThemeSegue", sender: self)
		}
	}
	
	private final func updateTraits() {
		guard let viewController = self.rootViewController else { return }
		self.setOverrideTraitCollection(self.overrideTraits, forChild: viewController)
	}
	
	open func setRootViewController(_ viewController: UIViewController?) {
		if viewController === self.rootViewController { return }
		
		if let oldValue = self.rootViewController {
			oldValue.willMove(toParent: nil)
			self.setOverrideTraitCollection(nil, forChild: oldValue)
			oldValue.view.removeFromSuperview()
			oldValue.removeFromParent()
			self.rootViewController = nil
		}
		
		self.rootViewController = viewController
		
		if let newValue = viewController {
			self.addChild(newValue)
			self.view.addSubview(newValue.view)
			newValue.didMove(toParent: self)
			self.updateTraits()
		}
	}
	
	open func setTraits(_ traits: UITraitCollection) {
		self.overrideTraits = traits
		self.updateTraits()
	}
	
	open func setUserInterfaceIdiom(_ userInterfaceIdiom: UIUserInterfaceIdiom) {
		self.setTraits(self.overrideTraits.with(userInterfaceIdiom))
	}
	
	open func setHorizontalSizeClass(_ horizontalSizeClass: UIUserInterfaceSizeClass) {
		self.setTraits(self.overrideTraits.with(horizontal: horizontalSizeClass))
	}
	
	open func setVerticalSizeClass(_ verticalSizeClass: UIUserInterfaceSizeClass) {
		self.setTraits(self.overrideTraits.with(vertical: verticalSizeClass))
	}
	
	open func setPreferredContentSizeCategory(_ preferredContentSizeCategory: UIContentSizeCategory) {
		self.setTraits(self.overrideTraits.with(preferredContentSizeCategory))
	}
	
	@available(iOS 10.0, tvOS 10.0, *)
	open func setLayoutDirection(_ layoutDirection: UITraitEnvironmentLayoutDirection) {
		self.setTraits(self.overrideTraits.with(layoutDirection))
	}
	
	@available(iOS 10.0, tvOS 10.0, *)
	open func setDisplayGamut(_ displayGamut: UIDisplayGamut) {
		self.setTraits(self.overrideTraits.with(displayGamut))
	}
	
	@available(iOS 12.0, tvOS 10.0, *)
	open func setUserInterfaceStyle(_ userInterfaceStyle: UIUserInterfaceStyle) {
		self.setTraits(self.overrideTraits.with(userInterfaceStyle))
	}
	
	@available(iOS 13.0, tvOS 13.0, *)
	open func setAccessibilityContrast(_ accessibilityContrast: UIAccessibilityContrast) {
		self.setTraits(self.overrideTraits.with(accessibilityContrast))
	}
	
	#if !os(tvOS)
	@available(iOS 13.0, *)
	open func setUserInterfaceLevel(_ userInterfaceLevel: UIUserInterfaceLevel) {
		self.setTraits(self.overrideTraits.with(userInterfaceLevel))
	}
	#endif
	
	@available(iOS 13.0, tvOS 13.0, *)
	open func setLegibilityWeight(_ legibilityWeight: UILegibilityWeight) {
		self.setTraits(self.overrideTraits.with(legibilityWeight))
	}
	
	@available(iOS 14.0, tvOS 14.0, *)
	open func setActiveAppearance(_ activeAppearance: UIUserInterfaceActiveAppearance) {
		self.setTraits(self.overrideTraits.with(activeAppearance))
	}
}

#endif
