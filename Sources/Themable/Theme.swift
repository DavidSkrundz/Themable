//
//  Theme.swift
//  Themable
//

#if !os(macOS) && !os(watchOS)

import Color
import UIKit

open class Theme {
	public static let `default` = Theme()
	
	open var label: UIColor
	open var secondaryLabel: UIColor
	open var tertiaryLabel: UIColor
	open var quaternaryLabel: UIColor
	
	open var link: UIColor
	
	open var placeholderText: UIColor
	
	open var separator: UIColor
	open var opaqueSeparator: UIColor
	
	#if !os(tvOS)
	open var systemBackground: UIColor
	open var secondarySystemBackground: UIColor
	open var tertiarySystemBackground: UIColor
	
	open var systemGroupedBackground: UIColor
	open var secondarySystemGroupedBackground: UIColor
	open var tertiarySystemGroupedBackground: UIColor
	
	open var systemFill: UIColor
	open var secondarySystemFill: UIColor
	open var tertiarySystemFill: UIColor
	open var quaternarySystemFill: UIColor
	#endif
	
	public init() {
		self.label = Color.label
		self.secondaryLabel = Color.secondaryLabel
		self.tertiaryLabel = Color.tertiaryLabel
		self.quaternaryLabel = Color.quaternaryLabel
		
		self.link = Color.link
		
		self.placeholderText = Color.placeholderText
		
		self.separator = Color.separator
		self.opaqueSeparator = Color.opaqueSeparator
		
		#if !os(tvOS)
		self.systemBackground = Color.systemBackground
		self.secondarySystemBackground = Color.secondarySystemBackground
		self.tertiarySystemBackground = Color.tertiarySystemBackground
		
		self.systemGroupedBackground = Color.systemGroupedBackground
		self.secondarySystemGroupedBackground = Color.secondarySystemGroupedBackground
		self.tertiarySystemGroupedBackground = Color.tertiarySystemGroupedBackground
		
		self.systemFill = Color.systemFill
		self.secondarySystemFill = Color.secondarySystemFill
		self.tertiarySystemFill = Color.tertiarySystemFill
		self.quaternarySystemFill = Color.quaternarySystemFill
		#endif
	}
	
	public init(
		labelColor: UIColor,
		secondaryLabelColor: UIColor,
		tertiaryLabelColor: UIColor,
		quaternaryLabelColor: UIColor,
		
		linkColor: UIColor,
		
		placeholderTextColor: UIColor,
		
		separatorColor: UIColor,
		opaqueSeparatorColor: UIColor,
		
		systemBackgroundColor: UIColor,
		secondarySystemBackgroundColor: UIColor,
		tertiarySystemBackgroundColor: UIColor,
		
		systemGroupedBackgroundColor: UIColor,
		secondarySystemGroupedBackgroundColor: UIColor,
		tertiarySystemGroupedBackgroundColor: UIColor,
		
		systemFillColor: UIColor,
		secondarySystemFillColor: UIColor,
		tertiarySystemFillColor: UIColor,
		quaternarySystemFillColor: UIColor
	) {
		self.label = labelColor
		self.secondaryLabel = secondaryLabelColor
		self.tertiaryLabel = tertiaryLabelColor
		self.quaternaryLabel = quaternaryLabelColor
		
		self.link = linkColor
		
		self.placeholderText = placeholderTextColor
		
		self.separator = separatorColor
		self.opaqueSeparator = opaqueSeparatorColor
		
		#if !os(tvOS)
		self.systemBackground = systemBackgroundColor
		self.secondarySystemBackground = secondarySystemBackgroundColor
		self.tertiarySystemBackground = tertiarySystemBackgroundColor
		
		self.systemGroupedBackground = systemGroupedBackgroundColor
		self.secondarySystemGroupedBackground = secondarySystemGroupedBackgroundColor
		self.tertiarySystemGroupedBackground = tertiarySystemGroupedBackgroundColor
		
		self.systemFill = systemFillColor
		self.secondarySystemFill = secondarySystemFillColor
		self.tertiarySystemFill = tertiarySystemFillColor
		self.quaternarySystemFill = quaternarySystemFillColor
		#endif
	}
}

#endif
