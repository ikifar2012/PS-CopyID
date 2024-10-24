function Copy-ID {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [String]$hostname,
        [Parameter(Mandatory=$false)]
        [String]$id
    )
    
    # If no key specified, find existing keys
    if (-not $id) {
        $sshdir = Join-Path $HOME '.ssh'
        Write-Host "Testing Keys..."
        
        # Check for keys in preference order
        $keyTypes = @(
            @{ Type = "ED25519"; Path = Join-Path $sshdir 'id_ed25519.pub' },
            @{ Type = "ECDSA";   Path = Join-Path $sshdir 'id_ecdsa.pub' },
            @{ Type = "RSA";     Path = Join-Path $sshdir 'id_rsa.pub' }
        )

        foreach ($key in $keyTypes) {
            if (Test-Path -Path $key.Path) {
                Write-Host "Found $($key.Type) Key, Installing..."
                $id = $key.Path
                break
            }
        }

        if (-not $id) {
            Write-Warning "No keys found"
            $id = Read-Host -Prompt "Please manually enter the path to your public key"
        }
    }
    else {
        Write-Host "Installing Key..."
    }

    # Verify key exists
    if (-not (Test-Path -Path $id)) {
        throw "Could not find public key file: $id"
    }

    # The critical part: Remote commands to handle SSH directory and permissions
    $remoteCommands = @'
        mkdir -p ~/.ssh
        chmod 700 ~/.ssh
        touch ~/.ssh/authorized_keys
        chmod 600 ~/.ssh/authorized_keys
        cat >> ~/.ssh/authorized_keys
'@

    Get-Content $id | ssh $hostname $remoteCommands
}

Export-ModuleMember -Function Copy-ID