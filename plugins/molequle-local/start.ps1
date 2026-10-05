$ErrorActionPreference = 'Stop'
$env:PYTHONIOENCODING = 'utf-8'
if (-not $env:MOLEQULE_API_URL) {
    $env:MOLEQULE_API_URL = 'http://localhost:3333'
}

$localPython = Join-Path $PSScriptRoot '.venv/Scripts/python.exe'
if (Test-Path -LiteralPath $localPython) {
    & $localPython -c "import mcp, httpx"
    if ($LASTEXITCODE -ne 0) {
        [Console]::Error.WriteLine('Molequle dependencies are missing. Run setup.ps1 in the plugin folder.')
        exit 1
    }
    & $localPython -u (Join-Path $PSScriptRoot 'server/main.py')
    exit $LASTEXITCODE
}

if (Get-Command python -ErrorAction SilentlyContinue) {
    & python -c "import mcp, httpx"
    if ($LASTEXITCODE -ne 0) {
        [Console]::Error.WriteLine('Molequle dependencies are missing. Run setup.ps1 in the plugin folder.')
        exit 1
    }
    & python -u (Join-Path $PSScriptRoot 'server/main.py')
    exit $LASTEXITCODE
}

if (Get-Command py -ErrorAction SilentlyContinue) {
    & py -3 -c "import mcp, httpx"
    if ($LASTEXITCODE -ne 0) {
        [Console]::Error.WriteLine('Molequle dependencies are missing. Run setup.ps1 in the plugin folder.')
        exit 1
    }
    & py -3 -u (Join-Path $PSScriptRoot 'server/main.py')
    exit $LASTEXITCODE
}

[Console]::Error.WriteLine('Python 3.10 or newer is required. Install Python, then run setup.ps1.')
exit 1
