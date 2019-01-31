# SyncNestedtoFlat

Sync a nested folder structure and to a single flat folder using PowerShell

## GenerateTestData.ps1

This will generate created two folder and generated the nested folder structure and random files.

## Sync.ps1

This will copy all changes from source folder to flat folder. Hashes are used to see if files have changed and copied if needed. Files removed from source folder will also be removed from flat folder.

## MakeSourceChanges.ps1

This will create changes in the source data using random modifications, deletes and new files.