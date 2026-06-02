       IDENTIFICATION DIVISION.
       PROGRAM-ID. LESSON17.
       AUTHOR. BISOU.
       DATE-WRITTEN. 02-06-2026.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT WORKFILE ASSIGN TO "work.tpm".
           SELECT ORGFILE ASSIGN TO "student.dat"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT SORTEDFILE ASSIGN TO "student2.dat"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  ORGFILE.
       01  STUDDATA.
           03  IDNUM                PIC 9.
           03  STUDNAME             PIC X(10).
       
       SD WORKFILE.
       01  WSTUDDATA.
           03  WIDNUM               PIC 9.
           03  WSTUDNAME            PIC X(10).

       FD  SORTEDFILE.
       01  SSTUDDATA.
           03  SIDNUM                PIC 9.
           03  SSTUDNAME             PIC X(10).

       WORKING-STORAGE SECTION.

       PROCEDURE DIVISION.
           SORT WORKFILE ON ASCENDING KEY WIDNUM
               USING ORGFILE GIVING SORTEDFILE.

           STOP RUN.
