function Test-InternetConnection {
    param (
        [string]$TestUrl = "google.com"
    )
    try {
        $result = Test-Connection -ComputerName $TestUrl -Count 1 -Quiet
        return $result
    } catch {
        return $false
    }
}

$previousStatus = $null

Write-Output "Monitoring network availability. Press Ctrl+C to stop."

while ($true) {
    $currentStatus = Test-InternetConnection

    if ($currentStatus -ne $previousStatus) {
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        if ($currentStatus) {
            Write-Output "$timestamp - The PC is connected to the internet."
        } else {
            Write-Output "$timestamp - The PC is disconnected from the internet."
        }
        $previousStatus = $currentStatus
    }

    Start-Sleep -Seconds 1
}

