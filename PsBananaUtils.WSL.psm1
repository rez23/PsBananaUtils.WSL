. "$PSScriptRoot\Public\Get-WslVirtualDrivePaths.ps1"
. "$PSScriptRoot\Public\Start-WslVirtualDriveCleanup.ps1"

Export-ModuleMember -Function (Get-ChildItem "$PSScriptRoot\Public\*.ps1" -Recurse | ForEach-Object { $_.BaseName }) 