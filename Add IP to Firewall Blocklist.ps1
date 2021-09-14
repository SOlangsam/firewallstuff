$name = Get-NetFirewallrule -DisplayName "myblockers"

$ips = @( 
  "1.1.1.1",
  "2.2.2.2"
)

Set-NetFirewallRule -DisplayName $name.DisplayName -RemoteAddress $ips
