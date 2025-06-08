@echo off
REM ini pny gw plis jangan disentuh/ di run soalnya bakal beda dan error meledak pc mu

REM Fix variable assignments
set authServiceLocation=D:\Kuliah\Semt 6\Integrasi Aplikasi Enterprise\TUBES\auth-service
set driverServiceLocation=D:\Kuliah\Semt 6\Integrasi Aplikasi Enterprise\TUBES\driver-service\DriverService
set driverServicePort=8001
set vehicleServiceLocation=D:\Kuliah\Semt 6\Integrasi Aplikasi Enterprise\TUBES\Vehicle-Service
set vehicleServicePort=8000

REM Create a temporary script to hold process IDs
echo @echo off > kill_services.bat
echo echo Stopping all services... >> kill_services.bat

REM Start services and capture their PIDs
echo Starting Auth Service...
start /b cmd /c "cd /d "%authServiceLocation%" && npm run dev"
for /f "tokens=2" %%a in ('tasklist ^| findstr "node.exe"') do echo taskkill /F /PID %%a >> kill_services.bat

echo Starting Driver Service...
start /b cmd /c "cd /d "%driverServiceLocation%" && php artisan serve --port=%driverServicePort%"
for /f "tokens=2" %%a in ('tasklist ^| findstr "php.exe"') do echo taskkill /F /PID %%a >> kill_services.bat

echo Starting Vehicle Service...
start /b cmd /c "cd /d "%vehicleServiceLocation%" && php artisan serve --port=%vehicleServicePort%"
for /f "tokens=2" %%a in ('tasklist ^| findstr "php.exe"') do echo taskkill /F /PID %%a >> kill_services.bat

echo All services started in background.
echo.
echo Press Ctrl+C to stop all services.

REM This will keep the script running
timeout /t 86400 /nobreak

REM If we get here (unlikely), run the kill script
call kill_services.bat
del kill_services.bat