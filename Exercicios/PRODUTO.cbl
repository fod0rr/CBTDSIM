       Identification Division.
      *----------------------------------------------------*
       Program-Id.   PRODUTOS.
       Author.       BERGAMASCHI, MARCELO.
       Date-Written. 2025-09-26.
       Date-Compiled.
       Installation. IFSP-Cubatao.
       Security.     EXEMPLO DE CODIFICACAO COBOL
                     LACOS DE REPETICAO.

       Environment Division.
      *----------------------------------------------------*
       Configuration Section.
      *---------------------*
       Source-Computer.     IBM-PC.
       Object-Computer.     IBM-PC.
       Special-Names.
              Decimal-Point Is Comma.

       Data Division.
      *----------------------------------------------------*
       Working-Storage Section.
      *-----------------------*
       77  QTD-PRODUTOS                   Pic 9(04) Value Zeros.
       77  MONTANTE-GERAL                 Pic 9(08)V99 Value Zeros.
       77  SUB-TOTAL                      Pic 9(06)V99 Value Zeros.
       77  MASCARA                        Pic ZZ.ZZZ.ZZ9,99.
       77  FIM                            Pic X(02) Value Spaces.

       01  REGPROD.
              05 CODIGO.
                     10 COD               Pic 9(05) Value Zeros.
              05 DESCRICAO                Pic X(30) Value Spaces.
              05 VALOR-UNIT               Pic 9(05)V99 Value Zeros.
              05 QTD                      Pic 9(03) Value Zeros.
              05 FORNECEDOR.
                     10 COD-FORN          Pic 9(04) Value Zeros.
                     10 FONE-FORN.
                            15 DDD        Pic 9(04) Value Zeros.
                            15 NUMERO     Pic 9(08) Value Zeros.

       Procedure Division.
       INICIO.
              Perform ENTRAR-CODIGO.
              Perform ENTRAR-DADOS Until FIM = "OK".
              Perform EXIBIR-DADOS.
              Stop Run.

       ENTRAR-DADOS.
              Display "Descricao............:".
	      Accept DESCRICAO.
              Display "Valor unitario.......:".
              Accept VALOR-UNIT.
	      Display "Quantidade...........:".
              Accept QTD.
	      Display "Codigo do fornecedor.:".
	      Accept COD-FORN.
              Display "Telefone.............:".
	      Accept FONE-FORN.

              Add 1 To QTD-PRODUTOS.

              Multiply QTD By VALOR-UNIT Giving SUB-TOTAL.
              Add SUB-TOTAL To MONTANTE-GERAL.

              Perform ENTRAR-CODIGO.

       ENTRAR-CODIGO.
              Display "Digite o codigo...: ".
              Accept COD.
              If COD = Zeros
                Move "OK" To FIM.

       EXIBIR-DADOS.
              Move MONTANTE-GERAL To MASCARA.
              Display "Quantidade de produtos.: ", QTD-PRODUTOS.
              Display "Valor do montante geral: ", MASCARA.

       END-OF-JOB.
