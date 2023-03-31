Import-Module "$PSScriptRoot/../PSSodium"

if (!(Get-Module Pester -ErrorAction SilentlyContinue)) {
    Install-Module Pester -Force
}

function ConvertTo-Base64String($str) {
    $fileContentInBytes = [System.Text.Encoding]::UTF8.GetBytes($str)
    return [System.Convert]::ToBase64String($fileContentInBytes)
}

Describe 'Smoke' {
    Context 'Tests' {
        It 'works' {
            {
                $ErrorActionPreference = 'Stop'
                $params = @{
                    Text = 'asdf'
                    PublicKey = ConvertTo-Base64String 'asdfasdfasdfasdfasdfasdfasdfasdf'
                }
                ConvertTo-SodiumEncryptedString @params
            } | Should -Not -Throw
        }

        It 'Returns a string' {
            $params = @{
                Text = 'asdf'
                PublicKey = ConvertTo-Base64String 'asdfasdfasdfasdfasdfasdfasdfasdf'
            }
            ConvertTo-SodiumEncryptedString @params | Should -BeOfType [string]
        }
    }
}
