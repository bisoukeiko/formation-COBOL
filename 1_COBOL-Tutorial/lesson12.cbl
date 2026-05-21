       IDENTIFICATION DIVISION.
       PROGRAM-ID. LESSON12.
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
       01  W-EOF                   PIC A(1).

       PROCEDURE DIVISION.
           OPEN INPUT CUSTOMERFILE.
                PERFORM UNTIL W-EOF = "Y"
                    READ CUSTOMERFILE INTO W-CUSTOMERDATA
                        AT END
                            MOVE "Y" TO W-EOF
                        NOT AT END
                            DISPLAY W-CUSTOMERDATA
                    END-READ
                END-PERFORM.

           CLOSE CUSTOMERFILE.

           STOP RUN.
