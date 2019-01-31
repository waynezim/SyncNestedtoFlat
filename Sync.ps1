#Set Paths
$SourceFolder = (Resolve-Path ".\SRCFolder").Path
$FlatFolder = (Resolve-Path ".\FlatFolder").Path

#Get Source File Listing
$SourceFiles = Get-ChildItem -Path $SourceFolder -Recurse -File

$SourceFiles | ForEach-Object {
    $FlatName = "$FlatFolder\$_"
    #Test to see if file exists in Flat Folder
    if (Test-Path $FlatName) {

        #Generate File Hashes
        $SourceFileHash = (Get-FileHash $_.FullName).hash
        $DestinationFileHash = (Get-FileHash $FlatName).hash

        #Verify file is same between source and flat
        if ($SourceFileHash -ne $DestinationFileHash) {
            Copy-Item ($_.FullName) -Destination $FlatName -Force
            Write-Output "Hash Difference Copy: $($_.FullName) to $Flatname"
        }
        else {
            Write-Output "Hash Match: $($_.FullName) to $Flatname"
        }
    }
    else {
        Write-Output "File Missing Copy: $($_.FullName) to $Flatname"
        Copy-Item ($_.FullName) -Destination $FlatName
    }
}

$FlatFiles = Get-ChildItem $FlatFolder -File

#Compare Flat Files to Source Files with just filename
$RemoveFiles = (Compare-Object -ReferenceObject $FlatFiles -DifferenceObject $SourceFiles -Property name).name

if ($RemoveFiles) {
    $RemoveFiles | ForEach-Object {
        $RemoveFile = "$FlatFolder\$_"
        Write-Output "Remove Non Matching Flat File: $RemoveFile"
        Remove-Item $RemoveFile
    }
}