<#
Multiple Unit Converter v1.0 by Quake4
https://github.com/Quake4/MultipleUnit
License GPL-3.0
#>

class MultipleUnit {
	static [hashtable] $Known = @{
		"K" = 3
		"M" = 6
		"G" = 9
		"T" = 12
		"P" = 15
		"E" = 18
		"Z" = 21
		"Y" = 24
	}

	static [decimal] ToValue([string] $value, [string] $unit) {
		$unit = $unit.ToUpper()
		if ([MultipleUnit]::Known.ContainsKey($unit)) {
			[decimal] $val = $null
			try {
				#first - try convert by national culture
				$val = [decimal]::Parse($value)
			}
			catch {
				#two - try convert by invariant culture
				[decimal]::TryParse($value, [System.Globalization.NumberStyles]::Number, [System.Globalization.CultureInfo]::InvariantCulture, [ref] $val)
			}
			if ($val) {
				return $val * [Math]::Pow(10, [MultipleUnit]::Known."$unit")
			}
			else {
				throw [Exception]::new("Unknown value: " + $value)
			}
		}
		throw [Exception]::new("Unknown multiple unit: " + $unit)
	}
}