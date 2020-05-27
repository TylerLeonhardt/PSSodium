# PSSodium

A simple wrapper around [Sodium.Core](https://www.nuget.org/packages/Sodium.Core/). This was created for the [PowerShellForGitHub](https://github.com/microsoft/PowerShellForGitHub) PowerShell module so that it had a simple way to encrypt a string for GitHub Action Secrets.

Supported cmdlets:

* `ConvertTo-SodiumEncryptedString`

Roadmap:

* `ConvertFrom-SodiumEncryptedString`
