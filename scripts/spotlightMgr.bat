@echo off
title Windows Spotlight Icon Manager
echo 在启用 Windows 聚焦时，帮助你快速隐藏/显示“了解此图片”图标。
echo 作者：岚天呀
echo.
echo 0. 关闭此脚本
echo 1. 禁用
echo 2. 启用（默认）
set /p choose=请选择一个数字：


if %choose%==0 ( exit )

if %choose%==1 (
    echo 请在接下来的选项中点击“是”

    echo Windows Registry Editor Version 5.00 > temp.reg
    echo. >> temp.reg
    echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel] >> temp.reg
    echo "{2cc5ca98-6485-489a-920e-b3e88a6ccce3}"=dword:1 >> temp.reg

    call temp.reg
    del temp.reg
    cls
    echo 已隐藏“了解此图片”图标。
    set ok=114514
)


if %choose%==2 (
    echo 请在接下来的选项中点击“是”

    echo Windows Registry Editor Version 5.00 > temp.reg
    echo. >> temp.reg
    echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel] >> temp.reg
    echo "{2cc5ca98-6485-489a-920e-b3e88a6ccce3}"=- >> temp.reg

    call temp.reg
    del temp.reg
    cls
    echo 已显示“了解此图片”图标。
    set ok=114514
)


if %ok%==114514 (
    echo 请刷新桌面：
    echo 1. 已生效
    echo 2. 重启文件资源管理器（默认）
    set /p refresh=请选择一个数字：
)

if %refresh%==1 ( exit )
if %refresh%==2 ( cls & taskkill /f /im explorer.exe & start explorer & echo 已重启文件资源管理器。 & pause )