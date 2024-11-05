# Check if the script is run as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as an Administrator."
    exit
}

# Define the custom DNS entry
$customDnsEntry = "127.0.0.1 magic-numbers.local"

# Path to the hosts file
$hostsFilePath = "C:\Windows\System32\drivers\etc\hosts"

# Backup the existing hosts file
$backupFilePath = "$hostsFilePath.bak"
Copy-Item -Path $hostsFilePath -Destination $backupFilePath -Force

# Read the current content of the hosts file
$hostsContent = Get-Content -Path $hostsFilePath

# Check if the custom DNS entry already exists
if ($hostsContent -notcontains $customDnsEntry) {
    # Add the custom DNS entry to the hosts file content
    $hostsContent += $customDnsEntry

    # Write the updated content back to the hosts file
    Set-Content -Path $hostsFilePath -Value $hostsContent

    Write-Host "Custom DNS entry added successfully."
} else {
    Write-Host "Custom DNS entry already exists."
}