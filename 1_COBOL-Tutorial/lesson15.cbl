       IDENTIFICATION DIVISION.
       PROGRAM-ID. LESSON15.
       AUTHOR. BISOU.
       DATE-WRITTEN. 01-06-2026.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  TABLE1.
           03  FRIEND          PIC X(15) OCCURS 4 TIMES.

       01  CUSTTABLE.
           03  CUSTNAME OCCURS 5 TIMES.
               05  FNAME           PIC X(15).
               05  LNAME           PIC X(15).

       01  ORDERTABLE.
           03  PRODUCT OCCURS 2 TIMES INDEXED BY I.
               05  PRODNAME        PIC X(10).
               05  PRODSIZE OCCURS 3 TIMES INDEXED BY J.
                   07  SIZETYPE    PIC A.

       PROCEDURE DIVISION.
      * Table1
           DISPLAY "***** TABLE FRIEND *****".
           MOVE "Joy" TO FRIEND(1).
           MOVE "Willow" TO FRIEND(2).
           MOVE "Ivy" TO FRIEND(3).
           DISPLAY FRIEND(1).
           DISPLAY TABLE1.

      * Customer Table
           DISPLAY "***** TABLE CUSTOMER *****".
           MOVE "Paul" TO FNAME(1).
           MOVE "Smith" TO LNAME(1).
           MOVE "Sally" TO FNAME(2).
           MOVE "Smi" TO LNAME(2).
           DISPLAY CUSTNAME(1).
           DISPLAY CUSTTABLE.

      * Order Table
           DISPLAY "***** TABLE ORDER *****".
           SET I J TO 1.
           MOVE "Blue Shirt" TO PRODUCT(I).
           MOVE "S" TO PRODSIZE(I,J).
           SET J UP BY 1.
           MOVE "M" TO PRODSIZE(I,J).
           SET J DOWN BY 1.

           MOVE "Blue ShirtSMLRed Shirt SML" TO ORDERTABLE.

           PERFORM GETPRODUCT VARYING I FROM 1 BY 1 UNTIL I > 2.
           PERFORM LOOKUP.
           STOP RUN.

       GETPRODUCT.
           DISPLAY PRODUCT(I).
           PERFORM GETSIZES VARYING J FROM 1 BY 1 UNTIL J > 3.

       GETSIZES.
           DISPLAY PRODSIZE(I,J).

       LOOKUP.
           SET I TO 1.
           SEARCH PRODUCT
               AT END DISPLAY "Product Not Found"
               WHEN PRODNAME(I) = "Red Shirt"
                   DISPLAY "Red Shirt Found"
           END-SEARCH.
