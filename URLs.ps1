# This script is for accessing every URL in a CSV file and saving the URL's file contents in a local folder. Each file will be named as per the filename in the URL.
# Replace <filepath to CSV file> with where your file is stored, e.g. "C:\Users\Peter.Horniak\Desktop\URLs.csv".
# Replace <filepath to folder outputs> with where you want the output files to be stored, e.g. "C:\Users\Peter.Horniak\Desktop\RylVideos\".
# I have uploaded an example file called "URLs.csv". I created it using Power Query, which I uploaded as "URLs.xlsx".
# It is possible to load the XLSX file directly into PowerShell, but this requires installing extra modules, so I just exported it into a CSV.

$url = Get-Content "<filepath to CSV file>"

Foreach ($i in $url)
{
 $name   = Split-Path $i -Leaf
 $output = "<filepath to folder outputs>" + $name
 Invoke-WebRequest -Uri $i -OutFile $output
}