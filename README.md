# PS-CopyID
Simple Powershell Module to emulate `ssh-copy-id` based off of a blog post by [Christopher Heart](https://www.chrisjhart.com/Windows-10-ssh-copy-id/)
# Installation
Just type the following command to install it from the [Powershell Gallery](https://www.powershellgallery.com/packages/ps-copyid/):
```ps1
Install-Module -Name ps-copyid
```
Then Add it to your `$Profile` using the following command:
```ps1
Write-Output "Import-Module PS-CopyID" | Out-File -Append $Profile
```

# Usage
Simply type:
```ps1
Copy-ID username@hostname
```
Using the above example PS-CopyID will automatically copy the `id_rsa.pub` file in your `.ssh` folder of your PC to your server
If you would like to specify a directory follow this example:
```ps1
Copy-ID username@hostname \path\to\your\key
```

# Support Me
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/B0B84ZX96)