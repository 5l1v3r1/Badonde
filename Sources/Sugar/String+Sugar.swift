import Foundation

extension String {
	public init(staticString: StaticString) {
		self = staticString.withUTF8Buffer {
			String(decoding: $0, as: UTF8.self)
		}
	}

	public func matchesRegex(_ regex: String) -> Bool {
		return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
	}

	public func components(losslesslySeparatedBy separator: CharacterSet) -> [String] {
		var components = [String]()
		var latestSeparatorIndex = startIndex

		for index in indices {
			let character = self[index]
			let scalarValue = character.unicodeScalars.map { $0.value }.reduce(0, +)
			guard
				let scalar = Unicode.Scalar(scalarValue),
				separator.contains(scalar)
			else {
				continue
			}

			if index > latestSeparatorIndex {
				let component = String(self[latestSeparatorIndex..<index])
				components.append(component)
			}

			latestSeparatorIndex = index
		}

		if latestSeparatorIndex < endIndex {
			let component = String(self[latestSeparatorIndex..<endIndex])
			components.append(component)
		}

		return components
	}
}
