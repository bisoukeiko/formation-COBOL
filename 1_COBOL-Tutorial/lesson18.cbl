       IDENTIFICATION DIVISION.
       PROGRAM-ID. LESSON18.
       AUTHOR. BISOU.
       DATE-WRITTEN. 02-06-2026.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT WORKFILE ASSIGN TO "work.tpm".
           SELECT FILE1 ASSIGN TO "student.dat"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT FILE2 ASSIGN TO "student3.dat"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT NEWFILE ASSIGN TO "student4.dat"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  FILE1.
       01  STUDDATA.
           03  IDNUM                PIC 9.
           03  STUDNAME             PIC X(10).
       
       FD  FILE2.
       01  STUDDATA2.
           03  IDNUM2               PIC 9.
           03  STUDNAME2            PIC X(10).
       
       SD WORKFILE.
       01  WSTUDDATA.
           03  WIDNUM               PIC 9.
           03  WSTUDNAME            PIC X(10).

       FD  NEWFILE.
       01  NSTUDDATA.
           03  NIDNUM                PIC 9.
           03  NSTUDNAME             PIC X(10).

       WORKING-STORAGE SECTION.

       PROCEDURE DIVISION.
           MERGE WORKFILE ON ASCENDING KEY NIDNUM
               USING FILE1, FILE2 GIVING NEWFILE.

           STOP RUN.
