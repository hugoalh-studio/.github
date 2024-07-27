[PSCustomObject[]]$List = Import-Csv -LiteralPath (Join-Path -Path $PSScriptRoot -ChildPath 'list.tsv') -Delimiter "`t" -Encoding 'UTF8NoBOM'
ForEach ($Item In $List) {
	If ($Item.Freeze -eq '') {
		Invoke-WebRequest -Uri $Item.Uri -UseBasicParsing -MaximumRetryCount 5 -RetryIntervalSec 5 -Method 'Get' -OutFile (Join-Path -Path $PSScriptRoot -ChildPath $Item.FileName)
	}
}
