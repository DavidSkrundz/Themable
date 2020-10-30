//
//  ThemeSegue.swift
//  Themable
//

#if !os(macOS) && !os(watchOS)

import UIKit

public final class ThemeSegue: UIStoryboardSegue {
	public final override func perform() {
		guard let source = self.source as? ThemeController else {
			fatalError("ThemeSegue source must be a ThemeViewController!")
		}
		source.setRootViewController(self.destination)
	}
}

#endif
