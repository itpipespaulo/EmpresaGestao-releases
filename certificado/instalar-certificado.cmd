@echo off
rem Clique duas vezes para confiar na assinatura do EmpresaGestão neste usuário do Windows.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0instalar-certificado.ps1"
pause
