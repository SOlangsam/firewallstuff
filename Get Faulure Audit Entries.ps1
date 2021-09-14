## Get all Failure Audit Entries
$appEntries = Get-EventLog -LogName Application -Source 'MSSQL$INSTANCE' -EntryType FailureAudit | Select Message 

$List = New-Object System.Collections.Generic.List[System.Object]
foreach ($appEntry in $appEntries){

   [string] $Ip = [string]($appEntry.Message.Substring($appEntry.Message.LastIndexOf("CLIENT")+8)) ## Filter ip
   $Ip = $Ip.Substring(0, $Ip.Length-1) ## Remove last char
   $List.Add($Ip)    
}
$List | select -Unique 
