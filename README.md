# PS-CopyID
Simple Powershell Module to emulate `ssh-copy-id` based off of a blog post by [Christopher Heart](https://www.chrisjhart.com/Windows-10-ssh-copy-id/)
# Installation
Just type the following command to install it from the [Powershell Gallery](https://www.powershellgallery.com/packages/ps-copyid/):
```ps1
Install-Module -Name ps-copyid
```
# Usage
Simply type:
```ps1
PS-CopyID username@hostname
```
Using the above example PS-CopyID will automatically copy the `id_rsa.pub` file in your `.ssh` folder of your PC to your server


If you would like to specify a directory follow this example:
```ps1
PS-CopyID username@hostname \path\to\your\key
```