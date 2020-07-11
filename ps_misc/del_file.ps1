Param([string]$folder,[string]$ext)

Get-ChildItem -Recurse $folder | ForEach-Object{
    if($_.PSIsContainer){
        Write-Host フォルダなのでスキップ $_.FullName
    }else{
        $currentExt = [System.IO.Path]::GetExtension($_)
        if($currentExt -eq ("." + $ext)){
            Write-Host $ext なので削除 $_.FullName
            del $_.FullName
        }else{
            Write-Host $currentExt なのでなのでスキップ $_.FullName
        }
    }
}