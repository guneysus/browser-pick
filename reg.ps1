# Reg2CI (c) 2020 by Roger Zander
if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Classes\AhmedBrowserHTM") -ne $true) {  New-Item "HKCU:\SOFTWARE\Classes\AhmedBrowserHTM" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\Application") -ne $true) {  New-Item "HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\Application" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\DefaultIcon") -ne $true) {  New-Item "HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\DefaultIcon" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\shell") -ne $true) {  New-Item "HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\shell" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\shell\open") -ne $true) {  New-Item "HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\shell\open" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\shell\open\command") -ne $true) {  New-Item "HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\shell\open\command" -force -ea SilentlyContinue };
New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Classes\AhmedBrowserHTM' -Name '(default)' -Value 'AhmedBrowser HTML Document' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Classes\AhmedBrowserHTM' -Name 'AppUserModelId' -Value 'AhmedBrowser' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\Application' -Name 'AppUserModelId' -Value 'AhmedBrowser' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\Application' -Name 'ApplicationIcon' -Value 'C:\Users\tpahmedg\AppData\Local\AhmedBrowser\Application\BrowserPick.exe,0' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\Application' -Name 'ApplicationName' -Value 'AhmedBrowser' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\Application' -Name 'ApplicationDescription' -Value 'Access the Internet' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\Application' -Name 'ApplicationCompany' -Value 'AhmedBrowser Technologies AS.' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\DefaultIcon' -Name '(default)' -Value 'C:\Users\tpahmedg\AppData\Local\AhmedBrowser\Application\BrowserPick.exe,0' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Classes\AhmedBrowserHTM\shell\open\command' -Name '(default)' -Value '\"C:\Users\tpahmedg\AppData\Local\AhmedBrowser\Application\BrowserPick.exe\" --single-argument %1' -PropertyType String -Force -ea SilentlyContinue;
