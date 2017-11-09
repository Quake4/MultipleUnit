. .\MultipleUnit.ps1

$tests = @{
	"30.1 K" = 30100
	"50,1 K" = 50100
	"20,001 K" = 20.001 * 1000
	"5,000.1 K" = 5000.1 * 1000
	"5000.1 K" = 5000.1 * 1000
	"5 000,1 K" = 5000.1 * 1000
	"100500 M" = 100500 * 1000000
}

$tests.Keys | ForEach-Object {
	[string] $interval = $_
	Write-Host "Test: $interval" -ForegroundColor Yellow
	$val = $interval.Substring(0, $interval.Length - 1)
	$unit = $interval.Substring($interval.Length - 1, 1)
	$parsed = [MultipleUnit]::ToValue($val, $unit)
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

$tests = @{
	100500 = "100.50 K"
	2500000 = "2.50 M"
}

$tests.Keys | ForEach-Object {
	[string] $interval = $_
	Write-Host "Test: $interval" -ForegroundColor Yellow
	$parsed = [MultipleUnit]::ToStringInvariant($interval)
	if ($parsed -eq $tests."$interval") {
		Write-Host "Passed: [MultipleUnit]::ToStringInvariant(`"$interval`"): $parsed" -ForegroundColor Green
	}
	else {
		Write-Host "Failed: [MultipleUnit]::ToStringInvariant(`"$interval`"): $parsed != $($tests.$_)" -ForegroundColor Red
	}
	Remove-Variable parsed, interval
}

pause