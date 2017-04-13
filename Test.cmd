cd C:\Windows
for /f "delims=|" %%f in ('dir /b C:\Windows') do echo %%f
