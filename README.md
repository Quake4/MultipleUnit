# Multiple Unit Converter

* Convert kilo, mega, giga and etc into decimal value
* The formatting of displayed numbers (1.25 k)

## Example 
[decimal] $val = [MultipleUnit]::ToValue("100.500", "K")

$val value is 100500

## Known multiple units
* K - kilo - 10^3
* M - mega - 10^6
* G - giga - 10^9
* T - tera - 10^12
* P - peta - 10^15
* E - exa - 10^18
* Z - zetta - 10^21
* Y - yotta - 10^24

## Include
. .\MultipleUnit.ps1

## Usage
[decimal] $val = [MultipleUnit]::ToValue("100.500", "M")

## Requirements
PowerShell version >= 5.0

## License
[GPL-3.0](https://github.com/Quake4/MultipleUnit/blob/master/LICENSE)
