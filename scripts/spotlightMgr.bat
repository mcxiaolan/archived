@echo off
title Windows Spotlight Icon Manager
echo ������ Windows �۽�ʱ���������������/��ʾ���˽��ͼƬ��ͼ�ꡣ
echo ���ߣ����ѽ
echo.
echo 0. �رմ˽ű�
echo 1. ����
echo 2. ���ã�Ĭ�ϣ�
set /p choose=��ѡ��һ�����֣�


if %choose%==0 ( exit )

if %choose%==1 (
    echo ���ڽ�������ѡ���е�����ǡ�

    echo Windows Registry Editor Version 5.00 > temp.reg
    echo. >> temp.reg
    echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel] >> temp.reg
    echo "{2cc5ca98-6485-489a-920e-b3e88a6ccce3}"=dword:1 >> temp.reg

    call temp.reg
    del temp.reg
    cls
    echo �����ء��˽��ͼƬ��ͼ�ꡣ
    set ok=114514
)


if %choose%==2 (
    echo ���ڽ�������ѡ���е�����ǡ�

    echo Windows Registry Editor Version 5.00 > temp.reg
    echo. >> temp.reg
    echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel] >> temp.reg
    echo "{2cc5ca98-6485-489a-920e-b3e88a6ccce3}"=- >> temp.reg

    call temp.reg
    del temp.reg
    cls
    echo ����ʾ���˽��ͼƬ��ͼ�ꡣ
    set ok=114514
)


if %ok%==114514 (
    echo ��ˢ�����棺
    echo 1. ����Ч
    echo 2. �����ļ���Դ��������Ĭ�ϣ�
    set /p refresh=��ѡ��һ�����֣�
)

if %refresh%==1 ( exit )
if %refresh%==2 ( cls & taskkill /f /im explorer.exe & start explorer & echo �������ļ���Դ�������� & pause )