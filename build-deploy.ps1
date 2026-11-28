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

$srcLogos = Join-Path $PSScriptRoot "amc-logos"
if (-not (Test-Path $srcLogos)) {
    throw "Missing required deploy folder: amc-logos"
}
Copy-Item -Path $srcLogos -Destination (Join-Path $dist "amc-logos") -Recurse

$srcForms = Join-Path $PSScriptRoot "forms"
if (-not (Test-Path $srcForms)) {
    throw "Missing required deploy folder: forms"
}
$distForms = Join-Path $dist "forms"
New-Item -ItemType Directory -Path $distForms | Out-Null

# Collect PDFs referenced by any deployed HTML page
$referencedPdfs = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
foreach ($f in ($rootFiles | Where-Object { $_ -like "*.html" })) {
    $htmlContent = Get-Content -Path (Join-Path $PSScriptRoot $f) -Raw
    foreach ($m in [regex]::Matches($htmlContent, 'forms/([^"''\s<>]+\.pdf)', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)) {
        [void]$referencedPdfs.Add($m.Groups[1].Value)
    }
}

Write-Host "=== FORMS FILTER REPORT ==="
foreach ($pdfFile in (Get-ChildItem -Path $srcForms -File | Sort-Object Name)) {
    if ($referencedPdfs.Contains($pdfFile.Name)) {
        Copy-Item -Path $pdfFile.FullName -Destination (Join-Path $distForms $pdfFile.Name)
    } else {
        Write-Host ("  EXCLUDED: forms\{0} ({1:N0} bytes) - not referenced by any HTML page" -f $pdfFile.Name, $pdfFile.Length)
    }
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
