@echo off
setlocal enabledelayedexpansion

:: Header
cls
echo.
echo ------------------------------------------------------------------------
echo                        YSD EASY QB TO OX CONVERTER
echo ------------------------------------------------------------------------
echo.
pause

:: Menu for user selection
:menu
cls
echo Choose a category to convert:
echo [1] Drugs
echo [2] Items
echo [3] Weapons
echo [4] Exit
set /p "choice=Enter your choice (1-4): "

if "%choice%"=="1" goto drugs
if "%choice%"=="2" goto items
if "%choice%"=="3" goto weapons
if "%choice%"=="4" exit
echo Invalid choice. Please try again.
pause
goto menu

:: Conversion for drugs
:drugs
cls
echo Enter the drug details:
set /p "name=Drug name (e.g., amphetamine): "
set /p "label=Drug label (e.g., Amphetamine): "
set /p "weight=Weight (e.g., 1): "
set /p "stack=Stack (true/false): "
set /p "close=Close (true/false): "
set /p "image=Image file name (e.g., amphetamine.png): "

(
    echo                ["%name%"] = {
    echo                label = "%label%",
    echo                weight = %weight%,
    echo                stack = %stack%,
    echo                close = %close%,
    echo                client = { 
    echo                        image = '%image%'
    echo                },
    echo        },
) >> output_drugs.txt

echo Drug details converted successfully! Check "output_drugs.txt".
pause
goto menu

:: Conversion for items
:items
cls
echo Enter the item details:
set /p "name=Item name (e.g., burger): "
set /p "label=Item label (e.g., Burger): "
set /p "weight=Weight (e.g., 220): "
set /p "stack=Stack (true/false): "
set /p "close=Close (true/false): "
set /p "image=Image file name (e.g., burger.png): "

(
    echo                ["%name%"] = {
    echo                label = "%label%",
    echo                weight = %weight%,
    echo                stack = %stack%,
    echo                close = %close%,
    echo                client = { 
    echo                        image = '%image%'
    echo                },
    echo        },
) >> output_items.txt

echo Item details converted successfully! Check "output_items.txt".
pause
goto menu

:: Conversion for weapons
:weapons
cls
echo Enter the weapon details:
set /p "name=Weapon name (e.g., GLOCK17): "
set /p "ammoname=Ammo name (e.g., rifle): "

:: Set the weight to 2500 automatically
set "weight=2500"

:: Extract label from weapon name (remove "WEAPON_" prefix)
for /f "tokens=2 delims=_" %%a in ("%name%") do set "label=%%a"

:: Extract ammo name (remove "ammo-" prefix)
for /f "tokens=2 delims=-" %%b in ("%ammoname%") do set "ammo=%%b"

(
    echo                ["WEAPON_%name%"] = {
    echo                        label = '%label%',
    echo                        weight = %weight%,
    echo                        durability = 0.50,
    echo                        ammoname = 'ammo-%ammo%'
    echo                },
) >> output_weapons.txt

echo Weapon details converted successfully! Check "output_weapons.txt".
pause
goto menu
