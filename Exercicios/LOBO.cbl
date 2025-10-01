       Identification Division.
      *----------------------------------------------------*
       Program-Id.   LOBO.
       Author.       BERGAMASCHI, MARCELO.
       Date-Written. 2025-09-24.
       Date-Compiled.
       Installation. IFSP-Cubatao.
       Security.     EXEMPLO DE CODIFICACAO COBOL
                     DECISAO LOGICA.

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
       77  NOME                           Pic X(30) Value Spaces.
       77  SEXO                           Pic X(01) Value Space.
       77  PESSOA                         Pic X(07) Value Spaces.
       77  ANIMAL                         Pic X(07) Value Spaces.
       77  IDADE                          Pic 9(02) Value Zeros.

       01  DATA-NASCIMENTO.
           05 DIA                         Pic 9(02) Value Zeros.
           05 MES                         Pic 9(02) Value Zeros.
           05 ANO                         Pic 9(04) Value Zeros.

       Procedure Division.
      *----------------------------------------------------*
       INICIO.
              Display "Digite seu nome.:".
              Accept NOME.

              Display NOME ", qual seu sexo ? ".
              Accept SEXO.

              Display "Data de nascimento.:".
              Accept DATA-NASCIMENTO.

              Compute IDADE = 2025 - ANO.

              If SEXO = "m" Or "M"
                Move "do LOBO"    To ANIMAL
                Move "Mocinho" To PESSOA
              Else
                Move "da LOBA"    To ANIMAL
                Move "Mocinha" To PESSOA.

              Display "<--> idade :", IDADE.

              If IDADE Not < 40
                Display NOME, "voce esta na idade ", ANIMAL
              Else
                Display NOME, "voce e ", PESSOA.

	      Stop Run.
