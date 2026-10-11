# Day7 命令解析器自动对拍脚本
# 用法： .\check.ps1 .\parser.exe
param([string]$Exe = ".\parser.exe")

$ErrorActionPreference = "Stop"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $here

if (-not (Test-Path $Exe)) {
    Write-Host "找不到可执行文件: $Exe" -ForegroundColor Red
    Write-Host "请先编译，例如: gcc -Wall -Wextra main.c kv.c tokenize.c -o parser.exe"
    exit 1
}

$expected = @(Get-Content ".\day7_expected.txt" | ForEach-Object { $_.TrimEnd() })
# 注意：PowerShell 不支持 "<" 输入重定向，必须用管道喂 stdin
$actual   = @(Get-Content ".\day7_input.txt" | & $Exe | ForEach-Object { $_.TrimEnd() })

if ($expected.Count -eq 0) {
    Write-Host "day7_expected.txt 为空，请确认文件完整" -ForegroundColor Red
    exit 1
}

$max = [Math]::Max($expected.Count, $actual.Count)
$bad = 0
$shown = 0

for ($i = 0; $i -lt $max; $i++) {
    $e = if ($i -lt $expected.Count) { $expected[$i] } else { "<没有输出>" }
    $a = if ($i -lt $actual.Count)   { $actual[$i]   } else { "<没有输出>" }
    if ($e -ne $a) {
        $bad++
        if ($shown -lt 30) {
            Write-Host ("第 {0,2} 行   期望: {1}" -f ($i + 1), $e) -ForegroundColor Yellow
            Write-Host ("            实际: {0}" -f $a)               -ForegroundColor Yellow
            $shown++
        }
    }
}

Write-Host ""
if ($bad -eq 0) {
    Write-Host "PASS  输出与期望完全一致（$($expected.Count) 行）" -ForegroundColor Green
    exit 0
}

Write-Host ("FAIL  共 {0} 行不匹配（期望 {1} 行 / 实际 {2} 行）" -f $bad, $expected.Count, $actual.Count) -ForegroundColor Red
if ($bad -gt $shown) { Write-Host ("（只显示前 {0} 处）" -f $shown) }
Write-Host "提示：先看第一处差异，通常后面的都是它的连锁反应。"
exit 1