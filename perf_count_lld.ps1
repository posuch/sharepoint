$result = @{}
$result.data = @()

#(get-counter -Listset *).paths | ForEach-Object { 
(typeperf.exe -qx)| ForEach-Object { 
    if ($_ -Like "*SharePoint Publishing Cache*" -or $_ -Like "*SharePoint Foundation*") { 
        $result.data += @{
            "{#PATH}" = $_
        }
    }
} 

$result | ConvertTo-Json