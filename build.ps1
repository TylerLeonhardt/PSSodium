$targetRuntimes = @(
    'osx-x64'
    'linux-x64'
    'win-x64'
    'win-x86'
)

foreach ($tr in $targetRuntimes) {
    dotnet publish -r $tr
    Remove-Item -Force -Recurse -Path "$PSScriptRoot/PSSodium/$tr" -ErrorAction Ignore
    Copy-Item -Recurse -Force -Path "$PSScriptRoot/bin/Debug/netstandard2.0/$tr/publish" -Destination "$PSScriptRoot/PSSodium/$tr"
}
