# PSCleanupizer

## What is it?

Currently a script to remove AppXPackages from overly-bloated default Windows installations. It will iterate over your selection and either delete or push the results into a manifest.

## Parameters

### Filter

String matches packages to remove. For example, `./Start-PSCleanupizer -Filter Xbox` will display all the packages with XBox in the name and ask if you would like to remove them individually.

### Output

Specify a text file to dump the packages you'd like to remove. For example, `./Start-PSCleanupizer -Output results.txt` should give you just a list of package names you approved for deletion.

### Manifest

Specify a manifest to process. The manifest is the output file listed above. Allows you to move a set manifest of things to remove across systems.

## TODO

- Error handling is nice.
- Tests are nice, too.
- Currently biffs if you try a manifest against a package that doesn't exists. Need some logic there.
- Ultimately roll this into a proper module once it figures out what it wants to be when it grows up.

### Contributions

- Yes, please. Issues a pull/merge request.
