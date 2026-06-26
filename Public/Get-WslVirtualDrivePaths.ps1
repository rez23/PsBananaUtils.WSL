function Get-WslVirtualDrivePaths {
    $DockerFiles = Get-ChildItem $env:LOCALAPPDATA\Docker\*\*.vhdx -Recurse
    $SystemFiles = Get-ChildItem $env:LOCALAPPDATA\Packages\*\*.vhdx -Recurse
    
    # Directly get FullName paths from both arrays
    (@($DockerFiles) + @($SystemFiles)).FullName
}