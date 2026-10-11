# Week 1：C 语言地基（10/12 – 10/18）

> 完整练习手册（含测试数据、验收清单、卡住时的提示）见 [`第1周练习手册.md`](第1周练习手册.md)

| Day | 日期 | 内容 | 产出目录 | 完成 |
|---|---|---|---|---|
| 1 | 10/12 | 环境搭建、数据类型与运算符 | `day1-calc/` | [ ] |
| 2 | 10/13 | 指针、表达式追踪表、二进制打印 | `day2-pointer/` | [ ] |
| 3 | 10/14 | 手写 strlen/strcpy/strcmp/memcpy/memmove/memset | `day3-string/` | [ ] |
| 4 | 10/15 | 结构体、联合体、内存对齐、结构体排序 | `day4-struct/` | [ ] |
| 5 | 10/16 | 位运算宏、模拟 GPIO 寄存器、reverse_bits | `day5-reg/` | [ ] |
| 6 | 10/17 | 函数指针回调表、状态机分词器、static 实验 | `day6-funcptr/` | [ ] |
| 7 | 10/18 | 综合项目：key-value 命令解析器 + 对拍通过 | `day7-parser/` | [ ] |

## 本周过关标准

1. `gcc -Wall -Wextra` 零警告
2. Day7 的 `check.ps1` 显示 PASS（22 行输出逐字匹配）
3. 8 个必答问题全部能闭卷回答（见 `notes/踩坑表.md`）
4. 本周至少 7 次 git 提交

## 编译示例

```powershell
cd day3-string
gcc -Wall -Wextra my_string.c test_string.c -o test_string.exe
.\test_string.exe
```

## Day7 对拍

```powershell
cd day7-parser
gcc -Wall -Wextra main.c kv.c tokenize.c -o parser.exe
.\check.ps1 .\parser.exe
```