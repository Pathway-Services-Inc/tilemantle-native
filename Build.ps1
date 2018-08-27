[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
Set-StrictMode -Version 5.0

$thisDir = Split-Path $MyInvocation.MyCommand.Path -Parent

function pkg() {
    $pkgPath = Join-Path $thisDir "node_modules\.bin\pkg"
    & $pkgPath $args
    $result = $LASTEXITCODE
    if ($result -ne 0) {
    	throw "pkg exited with code $result."
    }
}

$outputPath = Join-Path $thisDir "tilemantle.exe"
$inputPath = Join-Path $thisDir "node_modules\tilemantle\bin\tilemantle.js"
pkg --targets node6-win-x64 --output $outputPath $inputPath
