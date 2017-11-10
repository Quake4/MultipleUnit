# Multiple Unit Converter

* Convert kilo, mega, giga and etc into decimal value
* The formatting of displayed numbers (1.25 k)

## Example 
```powershell
[decimal] $val = [MultipleUnit]::ToValue("100.5", "K")
```
Result: $val = 100500
```powershell
[MultipleUnit]::ToStringInvariant("2500000")
```
Result: 2.50 M
```powershell
[MultipleUnit]::ToStringInvariant("45000", "N0")
```
Result: 45 K

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
```powershell
[decimal] $val = [MultipleUnit]::ToValue("100.500", "M")
[string] $val = [MultipleUnit]::ToStringInvariant(100500, "N1", "Pa")
```

## Requirements
PowerShell version >= 5.0

## License
[GPL-3.0](https://github.com/Quake4/MultipleUnit/blob/master/LICENSE)
