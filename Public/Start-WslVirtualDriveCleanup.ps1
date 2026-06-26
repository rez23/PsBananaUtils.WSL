# Import needed functions
function Start-WslVirtualDriveCleanup {
    
    Write-Host "[*] Shutting down wsl machines..." -ForegroundColor Blue
    wsl --shutdown 

    $wsl_folder = Get-WslVIrtualDrivePaths

    $wsl_folder | ForEach-Object {
        $path = $_
        if (([System.IO.File]::Exists($path))) { 
            Write-Host "[*] Optimizing: '$path'..." -ForegroundColor Yellow
            Optimize-VHD $path -Mode Full
        }
    }
}