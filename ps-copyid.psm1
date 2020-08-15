function Copy-ID {
    param (
        [Parameter(Mandatory=$true)]
        [String]$hostname,
        $id="$env:USERPROFILE\.ssh\id_rsa.pub"
    )
    Get-Content $id | ssh $hostname "mkdir .ssh && touch .ssh/authorized_keys && cat >> .ssh/authorized_keys"
}
Export-ModuleMember -Function * -Alias *