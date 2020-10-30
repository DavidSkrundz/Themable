// swift-tools-version:5.0

import PackageDescription

let package = Package(
	name: "Themable",
	platforms: [
		.macOS("10.9"),
		.iOS("8.0"),
		.tvOS("9.0"),
		.watchOS("2.0"),
	],
	products: [
		.library(
			name: "Themable",
			targets: ["Themable"]),
	],
	dependencies: [
		.package(url: "https://github.com/DavidSkrundz/Color", from: "1.0.2"),
		.package(url: "https://github.com/DavidSkrundz/TraitCollection", from: "1.0.0"),
	],
	targets: [
		.target(
			name: "Themable",
			dependencies: [
				"Color",
				"TraitCollection",
			]),
	]
)
