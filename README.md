# Multiple Unit Converter

* Convert kilo, mega, giga etc in to decimal value
* The formatting of displayed numbers (1.25 k)

## Example 
???

## Known multiple units
* kilo
* mega
* giga
* tera
* peta
* exa
* zetta
* yotta

## Include
. .\MultipleUnit.ps1

## Usage
* [TimeStamp] $ts = [HumanInterval]::Parse("30 sec")
* $secs = [HumanInterval]::Parse("5 min 30 sec").TotalSeconds
* $mins = (Get-Interval "2 hour 15 min").TotalMinutes
* $mins = (Get-Interval -Interval "1day 6hours 45 mins").TotalMinutes

## Requirements
PowerShell version >= 5.0

## License
[GPL-3.0](https://github.com/Quake4/HumanInterval/blob/master/LICENSE)