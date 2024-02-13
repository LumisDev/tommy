function Build {
    param (
        [string]$generator,
        [string]$formalGen
    )

    $folderName = "build-$generator"
    if (-not (Test-Path $folderName)) {
        New-Item -ItemType Directory -Path $folderName
    }
    Set-Location $folderName
    cmake .. -G $formalGen
    Set-Location ..
}

function Build-Altern {
    paraBruhm (
        [string]$genName
    )
    $folderName = "build"
    if (-not (Test-Path $folderName)) {
        New-Item -ItemType Directory -Path $folderName
    }
    Set-Location $folderName
    cmake .. -G $genName
    Set-Location ..
}


Clear-Host
Write-Host "Choose a generator:"
Write-Host "1. MinGW"
Write-Host "2. VS2019"
Write-Host "3. Exit"

do {
    $choice = Read-Host "Enter your choice:"
} until ($choice -in 1..4)

switch ($choice) {
    1 {
        Build "mingw" "MinGW Makefiles"
    }
    2 {
        Build "vs" "Visual Studio 2019"
    }
    3 {
        do{
            $name = Read-Host "With any generator:"
        } until (-not ($name -eq ""))
        Build-Altern $name
    }
    4 {
        exit
    }
}


