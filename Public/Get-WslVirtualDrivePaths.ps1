<#
.SYNOPSIS
    Gets the paths of virtual drives used by WSL.
.DESCRIPTION
    This function retrieves the paths of virtual drives used by Windows Subsystem for Linux (WSL). It searches for .vhdx files in the Docker and Windows Packages directories within the user's local application data folder.
.EXAMPLE
    # Get the paths of virtual drives used by WSL
    Get-WslVirtualDrivePaths
#>
function Get-WslVirtualDrivePaths {
    $DockerFiles = Get-ChildItem $env:LOCALAPPDATA\Docker\*\*.vhdx -Recurse
    $SystemFiles = Get-ChildItem $env:LOCALAPPDATA\Packages\*\*.vhdx -Recurse
    
    # Directly get FullName paths from both arrays
    (@($DockerFiles) + @($SystemFiles)).FullName
}