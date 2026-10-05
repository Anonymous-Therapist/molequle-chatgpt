param([string]$PythonExecutable = 'python')
$ErrorActionPreference = 'Stop'

& $PythonExecutable -c "import sys; assert sys.version_info >= (3, 10), 'Python 3.10 or newer is required'"
if ($LASTEXITCODE -ne 0) {
    throw 'Choose a working Python 3.10+ interpreter with -PythonExecutable.'
}

& $PythonExecutable -m pip install --user -r (Join-Path $PSScriptRoot 'requirements.txt')
if ($LASTEXITCODE -ne 0) {
    throw 'Could not install the Molequle MCP dependencies.'
}

& $PythonExecutable -c "import mcp, httpx"
if ($LASTEXITCODE -ne 0) {
    throw 'The Molequle MCP dependency check failed.'
}

Write-Host 'Molequle MCP dependencies are ready.'
