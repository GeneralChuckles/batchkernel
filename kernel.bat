@echo off

echo Simple Terminal with Advanced Batch File Kernel
echo Type 'exit' to quit.

set "current_directory=%cd%"

:terminal_loop
set /p input="Terminal[%current_directory%]# "
if "%input%" == "exit" (
    echo Exiting terminal...
    exit /b
) else (
    call :execute_command "%input%"
)
goto :terminal_loop

:execute_command
rem You can extend this section to include more commands
if "%~1" == "hello" (
    echo Hello, World!
) else if "%~1" == "write_data" (
    call :write_data
) else if "%~1" == "read_data" (
    call :read_data
) else if "%~1" == "help" (
    call :show_help
) else if "%~1" == "clear" (
    cls
) else if "%~1" == "dir" (
    dir
) else if "%~1" == "date" (
    date /t
) else if "%~1" == "time" (
    time /t
) else if "%~1" == "ipconfig" (
    ipconfig
) else if "%~1" == "ping" (
    set /p ping_target="Enter target address or hostname: "
    ping %ping_target%
) else if "%~1" == "systeminfo" (
    systeminfo
) else if "%~1" == "tasklist" (
    tasklist
) else if "%~1" == "whoami" (
    whoami
) else if "%~1" == "tree" (
    tree
) else if "%~1" == "type" (
    set /p file_to_display="Enter file name: "
    type %file_to_display%
) else if "%~1" == "echo" (
    set /p text_to_echo="Enter text to echo: "
    echo %text_to_echo%
) else if "%~1" == "cd" (
    call :change_directory
) else if "%~1" == "exit" (
    echo Exiting kernel...
    exit /b
) else (
    echo Unknown command: %~1
)
exit /b

:write_data
set /p data="Enter data to write: "
echo %data% >> data.txt
echo Data written successfully.
exit /b

:read_data
if exist data.txt (
    echo Data from data.txt:
    type data.txt
) else (
    echo No data found in data.txt
)
exit /b

:show_help
echo Available commands:
echo hello - Display a greeting
echo write_data - Write data to a file
echo read_data - Read data from a file
echo help - Show this help message
echo clear - Clear the terminal screen
echo dir - List directory contents
echo date - Display the current date
echo time - Display the current time
echo ipconfig - Display IP configuration
echo ping - Send ICMP Echo Request to a target
echo systeminfo - Display system information
echo tasklist - Display currently running tasks
echo whoami - Display the current user
echo tree - Display directory tree
echo type - Display the contents of a file
echo echo - Echo text to the terminal
echo cd - Change the current directory
echo exit - Exit the terminal
exit /b

:change_directory
set /p new_directory="Enter directory to move to: "
if "%new_directory%" == "" (
    echo Syntax: cd [directory]
) else (
    cd /d "%new_directory%"
    if errorlevel 1 (
        echo Failed to change directory.
    ) else (
        set "current_directory=%cd%"
    )
)
exit /b
