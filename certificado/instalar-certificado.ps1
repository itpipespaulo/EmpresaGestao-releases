<#
  Faz este computador confiar na assinatura do EmpresaGestão (certificado
  autoassinado de Paulo Pereira). Depois disso o Windows mostra "Editor:
  Paulo Pereira" com assinatura válida, e as atualizações automáticas, que
  conferem a assinatura, passam a ser aceitas.

  Uso (PowerShell):
    .\instalar-certificado.ps1                 # só para o seu usuário (sem administrador)
    .\instalar-certificado.ps1 -TodoComputador # para todos os usuários (pedir como administrador)

  O Windows pergunta se você confia no certificado: confira a impressão
  digital abaixo e clique em "Sim".
#>
param([switch]$TodoComputador)

$ErrorActionPreference = "Stop"
$esperado = "408F5C05E976857AB01A75CD9B9BF9AA5087ED47"
$arquivo = Join-Path $PSScriptRoot "empresagestao-codesign.cer"
$cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2 $arquivo

if ($cert.Thumbprint -ne $esperado) {
  throw "Certificado inesperado ($($cert.Thumbprint)). Baixe de novo do repositório oficial."
}

Write-Host "Certificado: $($cert.Subject)"
Write-Host "Impressão digital: $($cert.Thumbprint)"
Write-Host "Válido até: $($cert.NotAfter.ToString('dd/MM/yyyy'))"

$local = if ($TodoComputador) { "LocalMachine" } else { "CurrentUser" }
foreach ($loja in @("TrustedPublisher", "Root")) {
  $store = New-Object System.Security.Cryptography.X509Certificates.X509Store $loja, $local
  $store.Open("ReadWrite")
  if ($store.Certificates.Find("FindByThumbprint", $esperado, $false).Count -eq 0) {
    $store.Add($cert)
    Write-Host "Adicionado em $local\$loja"
  } else {
    Write-Host "Já estava em $local\$loja"
  }
  $store.Close()
}
Write-Host "`nPronto: este computador confia nas versões assinadas do EmpresaGestão."
