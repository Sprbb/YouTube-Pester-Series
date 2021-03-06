#Apologies to whoever I stole this from, maybe @RamblingCookieMonster

$Public  = @( Get-ChildItem -Path $PSScriptRoot\Functions\Public\*.ps1 -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Functions\Private\*.ps1 -ErrorAction SilentlyContinue )

#Dot source the files
foreach ($import in @($Public + $Private))
{
    try
    {
        Write-Verbose "Importing $($Import.FullName)"
        . $import.fullname
    }
    catch
    {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

Export-ModuleMember -Function $Public.Basename