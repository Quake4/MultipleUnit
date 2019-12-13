. .\MultipleUnit.ps1

$tests = @{
	"30.1 K" = 30100
	"50,1 K" = 50100
	"20,001 K" = 20.001 * 1000
	"5.000,1 K" = 0 # this not parsed
	"5000.1 K" = 5000.1 * 1000
	"5 000,1 K" = 5000.1 * 1000
	"100500 M" = 100500 * 1000000
}

$tests.Keys | ForEach-Object {
	[string] $interval = $_
	Write-Host "Test: $interval" -ForegroundColor Yellow
	$val = $interval.Substring(0, $interval.Length - 1)
	$unit = $interval.Substring($interval.Length - 1, 1)
	[decimal] $parsed = 0
	try {
		$parsed = [MultipleUnit]::ToValue($val, $unit)
	}
	catch {}
	if (!$parsed) {
		try {
			$parsed = [MultipleUnit]::ToValueInvariant($val, $unit)
		}
		catch {}
	}
	if ($parsed -eq $tests."$interval") {
		Write-Host "Passed: [MultipleUnit]::ToValue(`"$val)`", `"$unit`"): $parsed" -ForegroundColor Green
	}
	else {
		Write-Host "Failed: [MultipleUnit]::ToValue(`"$val`", `"$unit`"): $parsed != $($tests.`"$interval`")" -ForegroundColor Red
	}
	Remove-Variable parsed, unit, val, interval
}

try {
	Write-Host "Test: 5 000.1 K" -ForegroundColor Yellow
	[MultipleUnit]::ToValue("5 000.1", "K")
}
catch {
	if ($_.FullyQualifiedErrorId -eq "Unknown value: 5 000.1") {
		Write-Host "Passed: [MultipleUnit]::ToValue(`"5 000.1`", `"K`"): Unknown value: 5 000.1" -ForegroundColor Green
	}
	else {
		Write-Host "Failed: [MultipleUnit]::ToValue(`"5 000.1`", `"K`"): Message not equal to `"Unknown value: 5 000.1`"" -ForegroundColor Red
	}
}

try {
	Write-Host "Test: 25000.1" -ForegroundColor Yellow
	$value = [MultipleUnit]::ToValueInvariant("25000.1", $null)
	if ($value -eq 25000.1) {
		Write-Host "Passed: [MultipleUnit]::ToValueInvariant(`"25000.1)`", `$null): $value" -ForegroundColor Green
	}
	else {
		Write-Host "Failed: [MultipleUnit]::ToValueInvariant(`"25000.1)`", `$null): $value" -ForegroundColor Red
	}
}
catch {
	Write-Host "Failed: [MultipleUnit]::ToValue(`"25000.1`", `$null): $_" -ForegroundColor Red
}

$tests = @{
	100500 = "100.50 K"
	2500000 = "2.50 M"
	99 = "99.00"
	999 = "999.00"
	1000 = "1.00 K"
}

$tests.Keys | ForEach-Object {
	[string] $interval = $_
	Write-Host "Test: $interval" -ForegroundColor Yellow
	$parsed = [MultipleUnit]::ToStringInvariant($interval)
	if ($parsed -eq $tests.$_) {
		Write-Host "Passed: [MultipleUnit]::ToStringInvariant(`"$interval`"): $parsed" -ForegroundColor Green
	}
	else {
		Write-Host "Failed: [MultipleUnit]::ToStringInvariant(`"$interval`"): $parsed != $($tests.$_)" -ForegroundColor Red
	}
	Remove-Variable parsed, interval
}

$tests = @{
	45000 = "45 K"
	9600000 = "10 M"
	123456789 = "123 M"
}

$tests.Keys | ForEach-Object {
	[string] $interval = $_
	Write-Host "Test: $interval" -ForegroundColor Yellow
	$parsed = [MultipleUnit]::ToStringInvariant($interval, "N0")
	if ($parsed -eq $tests.$_) {
		Write-Host "Passed: [MultipleUnit]::ToStringInvariant(`"$interval`"): $parsed" -ForegroundColor Green
	}
	else {
		Write-Host "Failed: [MultipleUnit]::ToStringInvariant(`"$interval`"): $parsed != $($tests.$_)" -ForegroundColor Red
	}
	Remove-Variable parsed, interval
}

$tests = @{
	"1000" = 1000
	"0.123456789" = 0.123456789
	"6.1e-7" = 0.00000061
	"6.1e-07" = 0.00000061
	"6.1e6" = 6100000
	"6.1e06" = 6100000
}

$tests.Keys | ForEach-Object {
	[string] $interval = $_
	Write-Host "Test: $interval" -ForegroundColor Yellow
	[decimal] $parsed = 0
	[string] $unit = [string]::Empty
	try {
		$parsed = [MultipleUnit]::ToValue($interval, $unit)
	}
	catch {}
	if (!$parsed) {
		try {
			$parsed = [MultipleUnit]::ToValueInvariant($interval, $unit)
		}
		catch {}
	}
	if ($parsed -eq $tests."$interval") {
		Write-Host "Passed: [MultipleUnit]::ToValue(`"$interval)`", `"$unit`"): $parsed" -ForegroundColor Green
	}
	else {
		Write-Host "Failed: [MultipleUnit]::ToValue(`"$interval`", `"$unit`"): $parsed != $($tests.`"$interval`")" -ForegroundColor Red
	}
	Remove-Variable parsed, unit, interval
}