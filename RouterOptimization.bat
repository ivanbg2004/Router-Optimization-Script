@echo off
:: ===============================================
:: Router Optimization Script
:: Powered by Oblivion Development & Hosting
:: ===============================================

:: Display the current network settings
echo Displaying current network configurations...
ipconfig /all
echo.

:: Flush the DNS cache for faster name resolution
echo Flushing DNS cache...
ipconfig /flushdns
echo.

:: Renew the IP configuration for a fresh network connection
echo Renewing IP address...
ipconfig /release
ipconfig /renew
echo.

:: Resetting TCP/IP stack for better connectivity
echo Resetting TCP/IP stack...
netsh int ip reset
netsh winsock reset
echo.

:: Disable TCP auto-tuning to reduce packet delays
echo Disabling TCP auto-tuning...
netsh interface tcp set global autotuning=disabled
echo.

:: Disable Receive Side Scaling (RSS) to avoid bottlenecks
echo Disabling RSS...
netsh int tcp set global rss=disabled
echo.

:: Enable Direct Cache Access (DCA) for faster data transfer rates
echo Enabling Direct Cache Access (DCA)...
netsh int tcp set global dca=enabled
echo.

:: Disable TCP timestamps to reduce overhead
echo Disabling TCP timestamps...
netsh int tcp set global timestamps=disabled
echo.

:: Set the Maximum Transmission Unit (MTU) size to 1500 for optimal performance
echo Setting MTU size to 1500...
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent
echo.

:: Set DNS to Google Public DNS for faster and more reliable DNS lookups
echo Configuring Google Public DNS...
netsh interface ip set dns "Ethernet" static 8.8.8.8
netsh interface ip add dns "Ethernet" 8.8.4.4 index=2
echo.

:: Cleaning old routes for a more efficient routing path
echo Cleaning old routing entries...
route /f
echo.

:: Displaying current DNS settings for verification
echo Verifying DNS settings...
ipconfig /displaydns
echo.

:: Final message
echo ===============================================
echo Router optimization completed successfully!
echo Script powered by Oblivion Development & Hosting.
echo ===============================================
pause
