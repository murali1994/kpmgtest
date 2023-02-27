$keyName = "vmdeployment"  # Replace with the name of the data key you want to retrieve

$metadataUri = "http://169.254.169.254/metadata/instance/$keyName?api-version=2021-09-01"

$headers = @{ Metadata = 'true' }

$metadataValue = Invoke-RestMethod -Uri $metadataUri -Headers $headers

if (![string]::IsNullOrWhiteSpace($metadataValue)) {
  $metadataJson = @{ $keyName = $metadataValue } | ConvertTo-Json -Depth 100
  Write-Output $metadataJson
}