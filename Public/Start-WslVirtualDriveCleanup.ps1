<#
.SYNOPSIS
    Cleans up virtual drives used by WSL.
.DESCRIPTION
    This function shuts down all WSL instances and optimizes the virtual drives used by Windows Subsystem for Linux (WSL). It retrieves the paths of .vhdx files in the Docker and Windows Packages directories within the user's local application data folder and optimizes them using the Optimize-VHD cmdlet.
.EXAMPLE
    # Clean up virtual drives used by WSL
    Start-WslVirtualDriveCleanup
.NOTES
    Requires WSL to be installed and the Optimize-VHD cmdlet to be available (part of the Hyper-V module). 
    Ensure you have the necessary permissions to perform these operations.
#>
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