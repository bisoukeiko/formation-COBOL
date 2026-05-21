       IDENTIFICATION DIVISION.
       PROGRAM-ID. LESSON10.
       AUTHOR. BISOU.
       DATE-WRITTEN. 21-05-2026.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUSTOMERFILE ASSIGN TO "Customer.dat" 
                  ORGANIZATION IS LINE SEQUENTIAL
                  ACCESS IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  CUSTOMERFILE.
       01  CUSTOMERDATA.
           03  IDNUM               PIC 9(5).
           03  CUSTNAME.
               05  FIRSTNAME       PIC X(15).
               05  LASTNAME        PIC X(15).

       WORKING-STORAGE SECTION.
       01  W-CUSTOMERDATA.
           03  W-IDNUM             PIC 9(5).
           03  W-CUSTNAME.
               05  W-FIRSTNAME     PIC X(15).
               05  W-LASTNAME      PIC X(15).

       PROCEDURE DIVISION.
           OPEN OUTPUT CUSTOMERFILE.
               MOVE 00001 TO IDNUM.
               MOVE 'Doug' TO FIRSTNAME.
               MOVE 'Thomas' TO LASTNAME.
               WRITE CUSTOMERDATA
               END-WRITE.
           CLOSE CUSTOMERFILE.

           STOP RUN.
