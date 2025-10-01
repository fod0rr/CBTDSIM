       Identification Division.
      *----------------------------------------------------*
       Program-Id.   Arq-Texto.
       Author.       BERGAMASCHI, MARCELO.
       Date-Written. 2025-10-01.
       Date-Compiled.
       Installation. IFSP-Cubatao.
       Security.     EXEMPLO DE CODIFICACAOO COBOL
                     Arquivo texto.

       Environment Division.
      *----------------------------------------------------*
       Configuration Section.
      *---------------------*
       Source-Computer.     IBM-PC.
       Object-Computer.     IBM-PC.
       Special-Names.
              Decimal-Point Is Comma.

       Input-Output Section.
       File-Control.
           Select ARQUIVO-CLIENTES Assign to DISK
           Organization Is Line SEQUENTIAL
           Access Mode Is SEQUENTIAL
           File Status Is ERRO.

       Data Division.
      *----------------------------------------------------*
       File Section.
      *------------*
       FD  ARQUIVO-CLIENTES
           Label Record Is Standard
           Record Contains 46 Characters
           Block Contains 10 Records
           Data Record Is REGISTRO-CLIENTE
           Value Of File-Id "CLIENTES.TXT".

       01  REGISTRO-CLIENTE.
           05 CODIGO                      Pic 9(05).
           05 NOME                        Pic X(30).
           05 SEXO                        Pic X(01).
           05 IDADE                       Pic 9(02).
           05 SALARIO                     Pic 9(05)V99.
           05 TIPO                        Pic X(01).

       Working-Storage Section.
      *-----------------------*
       77  ERRO                           Pic X(02) Value "00".
       77  FIM                            Pic X(02) Value Spaces.
       77  CONTA-CLI                      Pic 9(03) Value Zeros.
       77  ACUMULA-SALARIO                Pic 9(07)V99 Value Zeros.
       77  MEDIA                          Pic 9(07)V99 Value Zeros.
       77  MASCARA-MEDIA                  Pic ZZ.ZZ9,99.

       01  REGISTRO-CLIENTE-AUX.
           05 CODIGO-AUX                  Pic 9(05) Value Zeros.
           05 NOME-AUX                    Pic X(30) Value Spaces.
           05 SEXO-AUX                    Pic X(01) Value Spaces.
              88 SEXO-OK Value "f", "F", "M", "m".
              88 MACHO   Value "m", "M".
           05 IDADE-AUX                   Pic 9(02) Value Zeros.
           05 SALARIO-AUX                 Pic 9(05)V99 Value Zeros.
           05 TIPO-AUX                    Pic X(01) Value Spaces.

       Procedure Division.
       INICIO.
           Perform ABRIR.
           Perform CADASTRAR Until FIM = "OK".
           Perform FECHAR.
           Stop Run.

       ABRIR.
           Move Zeros To CONTA-CLI, ACUMULA-SALARIO.
           Move Spaces To FIM.
           Open OUTPUT ARQUIVO-CLIENTES.
           Perform ENTRAR-CODIGO.

       CADASTRAR.
           Move CODIGO-AUX To CODIGO.

           Move Spaces to NOME-AUX, SEXO-AUX.
           Move Zeros To IDADE-AUX, SALARIO-AUX.

           Perform ENTRAR-NOME UNTIL NOME-AUX Not = Spaces.
           Perform ENTRAR-SEXO UNTIL SEXO-OK.
           Perform ENTRAR-IDADE UNTIL IDADE-AUX > Zeros.
           Perform ENTRAR-SALARIO UNTIL SALARIO-AUX > Zeros.
           Perform ATRIBUIR-TIPO.

           Add 1 To CONTA-CLI.
           Add SALARIO-AUX To ACUMULA-SALARIO.

           Move REGISTRO-CLIENTE-AUX To REGISTRO-CLIENTE.
           Write REGISTRO-CLIENTE.

           Perform ENTRAR-CODIGO.

       ENTRAR-CODIGO.
           Display "Digite o codigo : ".
           Accept CODIGO-AUX.
           If CODIGO-AUX = Zeros
              Move "OK" To FIM.

       ENTRAR-NOME.
           Display "Nome do cliente : ".
           Accept NOME-AUX.
           If NOME-AUX = Spaces
              Display "Nao pode ficar em branco !".

       ENTRAR-SEXO.
           Display "Sexo.....: ".
           Accept SEXO-AUX.
           If SEXO-OK
              If MACHO
                 Move "M" To SEXO-AUX
              Else
                 Move "F" To SEXO-AUX
           Else
              Display "Sexo incorreto !".

       ENTRAR-IDADE.
           Display "Idade....: ".
           Accept IDADE-AUX.
           If IDADE-AUX = Zeros
              Display "Idade deve ser positiva !".

       ENTRAR-SALARIO.
           Display "Salario..: ".
           Accept SALARIO-AUX.
           If SALARIO-AUX = Zeros
              Display "Salario deve ser positivo !".

       ATRIBUIR-TIPO.
           If SALARIO-AUX < 3000
              Move "A" To TIPO-AUX
           Else
              If SALARIO-AUX < 5000
                 Move "B" To TIPO-AUX
              Else
                 Move "C" To TIPO-AUX.

       FECHAR.
              If CONTA-CLI > Zeros
                Compute MEDIA = ACUMULA-SALARIO / CONTA-CLI
                Move MEDIA To MASCARA-MEDIA
                Display "Clientes cadastrados : ", CONTA-CLI,
                        "M dia dos sal rios : ", MASCARA-MEDIA.

              Close ARQUIVO-CLIENTES.

       END-OF-JOB.
