Param(
    [String] $Filter, # Search for a particular string of packages
    [String] $Manifest, # Supply a manifest of things you already want to clean
    [String] $Output # Save the kill list to a text file
)
# Making a kill list for fun and profit.
[System.Collections.ArrayList] $killList = @()

function processApps {
    param($query)
    foreach ($app in $query) {
        $resp = Read-Host "Do you wish to delete $($app.Name) ($($app.PackageFullName))"
        if ($resp -match "^yes$|^y$") { 
            $killList.Add("$app") | Out-Null
        }   
    }
}

function deleteApps {
    Write-Output $killList
    $resp = Read-Host "I will delete the above packages. To confirm, type 'yes'"
    if ($resp -match "^yes$") { 
        foreach ($app in $killList) {
            Write-Output "Deleting ${app}..."
            Remove-AppXPackage $app
        }
    }
}

if ($Filter) {
    [Array] $query = Get-AppXPackage | Where-Object { $_.PackageFullName -match $Filter }
    processApps -query $query
} elseif ($Manifest) {
    [Array] $query = Get-Content $Manifest
    $killList = $query
}
else{ 
    [Array] $query = Get-AppXPackage
    processApps -query $query
}


if ($Output) {
    Write-Output "Writing manifest to ${Output}..."
    Set-Content $Output -Value $killList
} else {
    if ($killList.Count -gt 0) {
        deleteApps
    } else { Write-Output 'No apps to kill. Bummer.'}
}
