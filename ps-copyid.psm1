function PS-CopyID {
    param (
        [Parameter(Mandatory=$true)]
        [String]$hostname,
        $id="$env:USERPROFILE\.ssh\id_rsa.pub"
    )
    Get-Content $id | ssh $hostname "cat >> .ssh/authorized_keys"
}