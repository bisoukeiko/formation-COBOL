       IDENTIFICATION DIVISION.
       PROGRAM-ID. lesson1.
       AUTHOR. BISOU.
       DATE-WRITTEN. 18 mai 2026.
       ENVIRONMENT DIVISION. 

       DATA DIVISION. 
       FILE SECTION.
       WORKING-STORAGE SECTION. 
       01 USERNAME      PIC X(30) VALUE "You".
       01 NUM1          PIC 9 VALUE ZEROS.
       01 NUM2          PIC 9 VALUE ZEROS.
       01 TOTAL         PIC 99 VALUE 0.
       01 SSNUM.
          05 SSAREA     PIC 999.
          05 SSGROUP    PIC 99.
          05 SSSERIAL   PIC 9999.
       01 PIVALUE       PIC 9V99 VALUE 3.14.

       PROCEDURE DIVISION.
           DISPLAY "What is your name ?" WITH NO ADVANCING.
           ACCEPT USERNAME
           DISPLAY "Hello " USERNAME.

           MOVE ZERO TO USERNAME.
           DISPLAY USERNAME.
           DISPLAY "Enter 2 values to sum ".
           ACCEPT NUM1.
           ACCEPT NUM2.
           COMPUTE TOTAL = NUM1 + NUM2.
           DISPLAY NUM1 " + " NUM2 " = " TOTAL.

           DISPLAY "Enter your Social Security Number (SSN) : ".
           ACCEPT SSNUM.
           DISPLAY "Area " SSArea.


       
           STOP RUN.
