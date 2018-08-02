<#
	===========================================================================
	 Created on:   	2017/03/10
	 Created by:   	Jim Moyle
	 GitHub link: 	https://github.com/JimMoyle/YouTube-Pester-Series
	 Twitter: 		@JimMoyle
	===========================================================================
#>

#Requires -RunAsAdministrator

# Current tested version and pre-reqs
$psversiontable.PSVersion

#Just in case it's not already done.
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

#See if Pester is there by default
Get-Module -ListAvailable -Name Pester

#Pester on the web

#Look for Pester in PSGallery
$moduleInfo = Find-Module -Name Pester

#what does it tell us?
$moduleinfo | Format-List *

#supported powershell version
$moduleInfo.AdditionalMetadata.PowerShellVersion

#look at documention
Start-Process $moduleinfo.ProjectUri

#look at PS Gallery
Start-Process 'https://www.powershellgallery.com/packages/Pester/'

#Cert is different from PS Gallery so we need to do some additional parameters
Install-Module -Name Pester -Force -SkipPublisherCheck

#Now you can update the module
Update-Module -Name Pester

#Now what do we see?
Get-Module -ListAvailable -Name Pester

#What does it look like on the filesystem?
Invoke-Item -Path C:\Program Files\WindowsPowerShell\Modules\Pester

#Does Powershell import the righht version?
Import-Module -Name Pester

#Quick look at the commands
Get-Command -Module Pester

#Start creating a function
New-Fixture -Path .\S2E1\New-Fixture -Name 'Test-Me'
