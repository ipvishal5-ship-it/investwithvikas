$ErrorActionPreference = "Stop"

$dist = Join-Path $PSScriptRoot "dist"
if (Test-Path $dist) {
    Remove-Item -Recurse -Force $dist
}
New-Item -ItemType Directory -Path $dist | Out-Null

$rootFiles = @(
    "index.html",
    "calculators.html",
    "kyc.html",
    "mf-forms.html",
    "mf-tools.html",
    "how-i-earn.html",
    "disclosures.html",
    "privacy.html",
    "robots.txt",
    "sitemap.xml",
    "logo.png",
    "vikas-agarwal.jpg"
)

foreach ($f in $rootFiles) {
    $src = Join-Path $PSScriptRoot $f
    if (-not (Test-Path $src)) {
        throw "Missing required deploy file: $f"
    }
    Copy-Item -Path $src -Destination (Join-Path $dist $f)
}

foreach ($dir in @("amc-logos", "forms")) {
    $srcDir = Join-Path $PSScriptRoot $dir
    if (-not (Test-Path $srcDir)) {
        throw "Missing required deploy folder: $dir"
    }
    Copy-Item -Path $srcDir -Destination (Join-Path $dist $dir) -Recurse
}

# Verify nothing unexpected ended up in dist\
$allowedRootNames = $rootFiles + @("amc-logos", "forms")
$actualRootItems = Get-ChildItem -Path $dist | Select-Object -ExpandProperty Name
foreach ($item in $actualRootItems) {
    if ($allowedRootNames -notcontains $item) {
        throw "Unexpected item found in dist\: $item"
    }
}

$allDistFiles = Get-ChildItem -Path $dist -Recurse -File
$totalBytes = ($allDistFiles | Measure-Object -Property Length -Sum).Sum

Write-Host "=== DEPLOY PACKAGE FILE LIST ==="
foreach ($file in $allDistFiles | Sort-Object FullName) {
    $rel = $file.FullName.Substring($dist.Length + 1)
    Write-Host ("  {0,-55} {1,12:N0} bytes" -f $rel, $file.Length)
}
Write-Host ("Total files: {0} | Total size: {1:N0} bytes ({2:N2} MB)" -f $allDistFiles.Count, $totalBytes, ($totalBytes / 1MB))
