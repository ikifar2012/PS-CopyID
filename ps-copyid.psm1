function Copy-ID {
    param (
        [Parameter(Mandatory=$true)]
        [String]$hostname,
        $id= $null
    )
    if ($null -eq $id) {
    $sshdir="$env:USERPROFILE\.ssh"
    $rsa=$(Test-Path -Path "$sshdir\id_rsa.pub")
    $ecdsa=$(Test-Path -Path "$sshdir\id_ecdsa.pub")
    $ed25519=$(Test-Path -Path "$sshdir\id_ed25519.pub")
    Write-Output "Testing Keys..."
    if ($ed25519 -eq "True") {
        Write-Output "Found ED25519 Key, Installing..."
        $id= "$sshdir\id_ed25519.pub"
    } elseif ($ecdsa -eq "True") {
        Write-Output "Found ECDSA Key, Installing..."
        $id= "$sshdir\id_ecdsa.pub"
    } elseif ($rsa -eq "True") {
        Write-Output "Found RSA Key, Installing..."
        $id= "$sshdir\id_rsa.pub"
    } else {
        Write-Warning "No keys found"
        $id= Read-Host -Prompt "Please manually enter the path to your public key"
    }
    } else {
        Write-Output "Installing Key..."
    }
    Get-Content $id | ssh $hostname "mkdir .ssh 2>/dev/null; chmod 700 .ssh 2>/dev/null; touch .ssh/authorized_keys 2>/dev/null; chmod 644 .ssh/authorized_keys 2>/dev/null; cat >> .ssh/authorized_keys"
}
Export-ModuleMember -Function * -Alias *