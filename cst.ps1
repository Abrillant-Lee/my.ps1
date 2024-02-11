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
