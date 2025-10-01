       Identification Division.
      *----------------------------------------------------*
       Program-Id.          MAIOR3.
       Author.              BERGAMASCHI, MARCELO.
       Date-Written.        2025-09-24.
       Date-Compiled.
       Installation.        IFSP-Cubat�o.
       Security.            PROGRAMA EXEMPLO DE CODIGO COBOL
                            ACHAR E EXIBIR O MAIOR DE 3 VALORES.
                            
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
       77  A                              Pic 9(03) Value Zeros.
       77  B                              Pic 9(03) Value Zeros.
       77  C                              Pic 9(03) Value Zeros.
       
       Procedure Division.
       INICIO.
              Display "Digite o 1� valor : ".
              Accept A.
              Display "Digite o 2� valor : ".
              Accept B.
              Display "Digite o 3� valor : ".
              Accept C.
              
              If A > B
                If A > C 
                  Display "O maior � ", A
                Else
                  Display "O maior � ", C
              Else
                If B > C 
                  Display "O maior � ", B
                Else
                  Display "O maior � ", C.
              
              Stop Run.