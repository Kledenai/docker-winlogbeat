for ($i=1; $i -le 10; $i++) {
  Write-Host "Attempting to run winlogbeat"
  $process = Start-Process -FilePath winlogbeat.exe -Wait -PassThru -ArgumentList $args
  if ($process.ExitCode -eq 0) { break }
  Start-Sleep 10
}
exit $process.ExitCode
