$excelPath = $PSScriptRoot + "`\" + "macro.xlsm"
$macroName = "StartMacro"

try{
    #ÉGÉNÉZÉãëÄçÏ
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
    $excel.DisplayAlerts = $false
    $book = $excel.Workbooks.Open($excelPath)
    $excel.run($macroName)
    $book.close()
}catch{
    Write-Host $error[0]
}finally{
    $excel.Quit()
    [void][System.Runtime.InteropServices.Marshal]::FinalReleaseComObject($book)
    [void][System.Runtime.InteropServices.Marshal]::FinalReleaseComObject($excel)
}