      ******************************************************************
      * Author: 
      * Date: 
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULAR-MEDIA.
       AUTHOR. BERGAMASCHI, MARCELO.
       DATE-WRITTEN. 05-03-1999.
       DATE-COMPILED.
       INSTALLATION. UNISANTA - SANTOS.
       SECURITY. PROGRAMA EXEMPLO DE CODIGO COBOL CALCULAR A MEDIA A PARTIR DE 4 NOTAS.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-PC-486-DX2-66-MHZ.
       OBJECT-COMPUTER. IBM-PC-AT-486-DX2-66-MHZ.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       77  P1 PIC 9(02)V9 VALUE ZEROS.
       77  P2 PIC 9(02)V9 VALUE ZEROS.
       77  P3 PIC 9(02)V9 VALUE ZEROS.
       77  P4 PIC 9(02)V9 VALUE ZEROS.
       77  MEDIA PIC 9(02)V9 VALUE ZEROS.
       77  MASCARA PIC Z9,9.
       
       PROCEDURE DIVISION.
       INICIO.
               
               DISPLAY "Digite a 1 nota : ".
               ACCEPT P1
               Display "Digite a 2 nota : ".
               ACCEPT P2 
               Display "Digite a 3 nota : ".
               ACCEPT P3 
               Display "Digite a 4 nota : ".
               ACCEPT P4 
               
               COMPUTE MEDIA = (P1 + P2 + P3 + P4) / 4.
               MOVE MEDIA   TO MASCARA.
               DISPLAY "A MEDIA EH".
               DISPLAY MASCARA.
               STOP RUN.
           END PROGRAM CALCULAR-MEDIA.
           