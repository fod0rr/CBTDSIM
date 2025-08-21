      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULA-SALARIO.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-PC-486-DX2-66-MHZ.
       OBJECT-COMPUTER. IBM-PC-AT-486-DX2-66-MHZ.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77  horas PIC 9(02)V9 VALUE ZEROS.
       77  valorHora PIC 9(02)V9 VALUE ZEROS.
       77  salarioBruto PIC 9(05)V99 VALUE ZEROS.
       77  salarioLiquido PIC 9(05)V99 VALUE ZEROS.
       77  MASCARA PIC ZZZZZ,99.
       
       PROCEDURE DIVISION.
       INICIO.
           DISPLAY "Digite a quantidade de Horas:"
           ACCEPT horas.
           DISPLAY "Digite o Valor da hora:"
           ACCEPT valorHora.
            
           COMPUTE salarioBruto = horas * valorHora * 5,25.
           
           IF salarioBruto <= 2260
               COMPUTE salarioLiquido = salarioBruto
           ELSE IF salarioBruto > 2260 AND salarioBruto < 2826
               COMPUTE salarioLiquido = salarioBruto - 
                   (salarioBruto * 0,075)
           ELSE IF salarioBruto > 2826 AND salarioBruto < 3751
               COMPUTE salarioLiquido = salarioBruto - 
                       (salarioBruto * 0,15)
           ELSE IF salarioBruto > 3751 AND salarioBruto < 4664
               COMPUTE salarioLiquido = salarioBruto - (salarioBruto 
               * 0,225)
           ELSE IF salarioBruto > 4664
               COMPUTE salarioLiquido = salarioBruto - (salarioBruto 
               * 0,275)
                               

           DISPLAY "Salario Bruto: " salarioBruto
           DISPLAY "Salario Liquido: " salarioLiquido.
      
       STOP RUN.
       END PROGRAM CALCULA-SALARIO.
