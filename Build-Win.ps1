function Build {
    param (
        [string]$generator,
        [string]$formalGen
    )

    $folderName = "build-$generator"
    if (-not (Test-Path $folderName)) {
        New-Item -ItemType Directory -Path $folderName | Out-Null
    }
    Set-Location $folderName
    cmake .. -G $formalGen
}


Clear-Host
Write-Host "Choose a generator:"
Write-Host "1. MinGW"
Write-Host "2. VS2019"
Write-Host "3. Exit"

do {
    $choice = Read-Host "Enter your choice"
} until ($choice -in 1..3)

switch ($choice) {
    1 {
        Build "mingw" "MinGW Makefiles"
    }
    2 {
        Build "vs" "Visual Studio 2019"
    }
    3 {
        exit
    }
}


