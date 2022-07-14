## Get all Failure Audit Entries
$appEntries = Get-EventLog -LogName Application -Source *MSSQL* -EntryType FailureAudit | Select Message 
$appEntries | Group-Object -Property Message -NoElement | Sort-Object -Property Count -Descending


$List = New-Object System.Collections.Generic.List[System.Object]
foreach ($appEntry in $appEntries){

   [string] $Ip = [string]($appEntry.Message.Substring($appEntry.Message.LastIndexOf("CLIENT")+8)) ## Filter ip
   $Ip = $Ip.Substring(0, $Ip.Length-1) ## Remove last char
   $List.Add($Ip)    
}
$List | select -Unique 
