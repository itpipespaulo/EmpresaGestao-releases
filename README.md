# EmpresaGestão — instaladores

Este repositório contém **apenas os instaladores** do programa EmpresaGestão para Windows,
usados pela atualização automática do próprio programa. O código-fonte é privado.

## Instalar

1. **Uma vez por computador:** baixe a pasta [`certificado`](certificado) (os três arquivos) e
   clique duas vezes em `instalar-certificado.cmd`. Na janela "Aviso de Segurança", confira a
   impressão digital `408F5C05 E976857A B01A75CD 9B9BF9AA 5087ED47` e clique em **Sim**.
   Isso faz o Windows reconhecer a assinatura ("Editor: Paulo Pereira") e permite as
   atualizações automáticas, que só aceitam versões assinadas por esse certificado.
2. Baixe o instalador mais recente em **Releases** (`EmpresaGestao-Setup-<versão>.exe`).

Os dados ficam no seu computador (`Documentos\EmpresaGestao\dados`); o instalador não contém dados.
