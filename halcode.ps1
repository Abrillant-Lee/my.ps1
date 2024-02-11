cd C:\Users\nan\nan\project\Stm32code\HAL
$baseDir = 'C:\Users\nan\nan\project\Stm32code\HAL'
$dirPath = Join-Path -Path $baseDir -ChildPath $args[0]
Set-Location -Path $baseDir
code $dirPath
