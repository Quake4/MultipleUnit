# Multiple Unit Converter

* Convert kilo, mega, giga etc in to decimal value
* The formatting of displayed numbers (1.25 k)

## Example 
[decimal] $val = [MultipleUnit]::ToValue("100.500", "K")
$val value is 100500

## Known multiple units
* kilo (K)
* mega (M)
* giga (G)
* tera (T)
* peta (P)
* exa (E)
* zetta (Z)
* yotta (Y)

## Include
. .\MultipleUnit.ps1

## Usage
[decimal] $val = [MultipleUnit]::ToValue("100.500", "M")

## Requirements
PowerShell version >= 5.0

## License
[GPL-3.0](https://github.com/Quake4/MultipleUnit/blob/master/LICENSE)