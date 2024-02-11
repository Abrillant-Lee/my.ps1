## <center>🚀我的Powershell脚本🚀</center>

### 1、更改路径
- [dkdir](./dkdir.ps1)
  > 为什么🤔：在日常的开发中，经常使用桌面来做一些小demo，日常进入桌面命令`cd ~/Desktop`，但是`~/`符号经常手误按错，导致浪费一些时间，所以用此脚本来简化输入流程。<br>
  如何使用⌨️:打开终端，输入`desktop`即可进入桌面。
- [gitdir](./gitdir.ps1)
  >为什么🤔：clone和push已经成为我的日常，github文件夹里面是我日常clon和push的项目，由于这个目录会经常使用，避免每次需要输入`cd C:\User\nan\nan\github`来进入我的GitHub文件夹，所以使用此脚本来简化输入流程。<br>
  如何使用⌨️:打开终端，输入`gitdir`即可进入个人GitHub日常使用文件夹。
- [haidir](./haldir.ps1)
  >为什么🤔：`haldir`代表使用hal库开发的stm32工程所在的目录，个人自定义即可，简化输入命令流程而创建。<br>
  如何使用⌨️:打开终端，输入`haldir`即可进入stm32hal库工程文件夹。
- [mbdir](./mbdir.ps1)
   >为什么🤔：`mbdir`代表我的脚本目录，个人自定义即可，简化输入命令流程而创建。<br>
  如何使用⌨️:打开终端，输入`mybin`即可进入脚本文件夹。

### 2、创建模板

- [cst](./cst.ps1)：`create stm32 template`

  - 脚本功能：快速创建stm32模板，包含stm32F103VET6、STM32F103C8T6、STM32F407ZGT6的HAL库、标准库模板。

  - 脚本使用：进入`powershell`，输入`cst f4hal`/`cst led-f4hal`/`cst f4hal-led`,只要参数包含`f4`即可创建`STM32F407ZGT6`的hal库模板，其余模板类似。

  - 脚本说明：
  ```ps1
    # ct.ps1
    # 定义一个名为 $projectType 的参数，这将在运行脚本时从命令行接收
    param (
        [string]$projectType
    )

    # 定义一个变量 $templatePath，它是工程模板的路径
    $templatePath = "C:\Users\nan\nan\project\Stm32code\工程模板"

    # 使用 Get-Location 命令获取当前路径，并将其存储在 $currentPath 变量中
    $currentPath = Get-Location

    # 根据 $projectType 的值来决定要复制哪个工程模板
    if ($projectType -match "f4hal") {
        # 如果 $projectType 包含 "f4"，则将 $templatePath 和 "F407ZGT6-HAL" 连接起来，形成源路径
    #if ($projectType -eq "f4hal") {
        # 如果 $projectType 等于 "f4hal"，则将 $templatePath 和 "F407ZGT6-HAL" 连接起来，形成源路径
        $sourcePath = Join-Path -Path $templatePath -ChildPath "F407ZGT6-HAL"
    } elseif ($projectType -match "f1vehal") {
        # 如果 $projectType 等于 "f103vehal"，则将 $templatePath 和 "F103VET6-HAL" 连接起来，形成源路径
        $sourcePath = Join-Path -Path $templatePath -ChildPath "F103VET6-HAL"
    }elseif ($projectType -match "f1c8hal") {
        # 如果 $projectType 等于 "f103vehal"，则将 $templatePath 和 "F103VET6-HAL" 连接起来，形成源路径
        $sourcePath = Join-Path -Path $templatePath -ChildPath "F103C8T6-HAL"
    # 如果 $projectType 不是 "f4hal" 或 "f1hal"，则打印错误信息并退出脚本
    }else {
        Write-Host "Unknown project type: $projectType"
        exit 1
    }

    # 将 $currentPath 和 $projectType 连接起来，形成目标路径
    $destinationPath = Join-Path -Path $currentPath -ChildPath $projectType

    # 将源路径的文件和目录复制到目标路径，-Recurse 参数表示复制目录及其子目录，-Force 参数表示如果目标路径已存在，则覆盖它
    Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force

  ```

### 3、打开文件夹

- [halcode](./halcode.ps1) 
  - 脚本功能：`haldir`脚本的进阶版，多加了一个参数，即可以使用code打开参数文件夹。
  - 脚本说明：
  ```ps1
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
  ```
  


