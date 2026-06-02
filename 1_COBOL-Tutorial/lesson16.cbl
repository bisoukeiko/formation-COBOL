       IDENTIFICATION DIVISION.
       PROGRAM-ID. LESSON16.
       AUTHOR. BISOU.
       DATE-WRITTEN. 02-06-2026.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  PRDTABLE.
           03  PRODDATA.
               05  FILLER          PIC X(8) VALUE "Red  SML".
               05  FILLER          PIC X(8) VALUE "Blue SML".
               05  FILLER          PIC X(8) VALUE "GreenSML".
           03  FILLER REDEFINES PRODDATA.
               05  SHIRT OCCURS 3 TIMES.
                   07  PRODNAME    PIC X(5).
                   07  PRODSIZES   PIC A OCCURS 3 TIMES.
       01  CHANGEME.
           03  TEXTNUM             PIC X(6).
           03  FLOATNUM REDEFINES TEXTNUM PIC 9(4)V99.

       01  STRNUM                  PIC X(7).
       01  SPLITNUM.
           03  WNUM                PIC 9(4) VALUE ZERO.
           03  FNUM                PIC 99 VALUE ZERO.
       01  FLNUM REDEFINES SPLITNUM PIC 9999V99.
       01  DOLLARNUM               PIC $$,$$9.99.

       PROCEDURE DIVISION.
           DISPLAY SHIRT(1).
           MOVE "123456" TO TEXTNUM.
           DISPLAY FLOATNUM.

           DISPLAY "Enter a float : " WITH NO ADVANCING.
           ACCEPT STRNUM.
           UNSTRING STRNUM
               DELIMITED BY "." OR ALL SPACES INTO WNUM, FNUM.
           MOVE FLNUM TO DOLLARNUM.
           DISPLAY DOLLARNUM.

           STOP RUN.
