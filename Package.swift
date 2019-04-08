// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Badonde",
	platforms: [
		.macOS(.v10_12)
	],
	products: [
		.executable(name: "badonde", targets: ["Badonde"]),
		.executable(name: "burgh", targets: ["Burgh"])
	],
	dependencies: [
		.package(
			url: "https://github.com/DavdRoman/SwiftCLI",
			.branch("master")
		),
		.package(
			url: "https://github.com/DavdRoman/SwiftyStringScore",
			.branch("master")
		),
		.package(
			url: "https://github.com/DavdRoman/CLISpinner",
			.branch("master")
		)
	],
	targets: [
		.target(
			name: "Badonde",
			dependencies: ["BadondeCore"]
		),
		.target(
			name: "BadondeCore",
			dependencies: [
				"SwiftCLI",
				"SwiftyStringScore",
				"CLISpinner",
				"GitHub",
				"Jira",
				"Sugar"
			]
		),
		.target(
			name: "Burgh",
			dependencies: ["BadondeCore"]
		),
		.target(
			name: "GitHub",
			dependencies: ["Sugar"]
		),
		.testTarget(
			name: "GitHubTests",
			dependencies: ["GitHub"]
		),
		.target(
			name: "Jira",
			dependencies: ["Sugar"]
		),
		.target(
			name: "Sugar",
			dependencies: []
		)
	]
)

