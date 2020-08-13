function ssh-copy-id {
    param (
        $id="id_rsa.pub",
        $hostname
    )
    Get-Content $env:USERPROFILE\.ssh\$id | ssh $hostname "cat >> .ssh/authorized_keys"
}