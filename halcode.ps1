# 进入hal库工程目录
cd C:\Users\nan\nan\project\Stm32code\HAL

# 设置基础目录的路径
$baseDir = 'C:\Users\nan\nan\project\Stm32code\HAL'

# 使用 Join-Path 命令将基础目录和参数中的子目录路径连接起来
$dirPath = Join-Path -Path $baseDir -ChildPath $args[0]

# 使用 Set-Location 命令将当前位置（即当前活动目录）更改为基础目录
Set-Location -Path $baseDir

# 使用 code 命令打开 Visual Studio Code，并将其设置为新连接的目录路径
code $dirPath
