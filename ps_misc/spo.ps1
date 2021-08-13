$env:PSModulePath = $PSScriptRoot + "`\" + "Modules" + ";" + $env:PSModulePath

$PSScriptRoot
$env:PSModulePath

<#$
SPO DL

Connect-PnPOnline -Url "https://esq365.sharepoint.com/sites/msteams_93b0bf/" -UseWebLogin
Get-PnPFile -Url "Shared Documents/General/リンク消失.pptx" -AsFile -Path "C:\Users\worut\OneDrive\デスクトップ" -Filename "リンク消失2.pptx"
#>

<#
SPO UP

$from =  "C:\Users\worut\OneDrive\デスクトップ\リンク消失2.pptx"

Connect-PnPOnline -Url "https://esq365.sharepoint.com/sites/msteams_93b0bf/" -UseWebLogin

#Add-PnPFolder -Name Test111 -Folder "Shared Documents/General"
Add-PnPFile -Path $from -Folder "Shared Documents/General"
#>

<#
OneDrive DL

Connect-PnPOnline -Url "https://esq365-my.sharepoint.com/personal/shibata_kuniyasu_isid_co_jp/" -UseWebLogin
#Get-PnPConnection

Get-PnPFile -Url "Documents/リンク消失.pptx" -AsFile -Path "C:\Users\worut\OneDrive\デスクトップ" -Filename "リンク消失2.pptx"
#>


<#
OneDrive UP
#>

Connect-PnPOnline -Url "https://esq365-my.sharepoint.com/personal/shibata_kuniyasu_isid_co_jp/" -UseWebLogin
#Get-PnPConnection

#Resolve-PnPFolder -SiteRelativePath Documents/Test111
$from =  "C:\Users\worut\OneDrive\デスクトップ\リンク消失2.pptx"

Add-PnPFile -Path $from -Folder "Documents"

