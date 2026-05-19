       IDENTIFICATION DIVISION. 
       PROGRAM-ID. lesson3.
       AUTHOR. BISOU.
       DATE-WRITTEN.  2026-05-20.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           CLASS PASSINGSCORE IS "A" THRU "C", "D".

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  AGE              PIC 99 VALUE 0.
       01  GRADE            PIC 99 VALUE 0.
       01  SCORE            PIC X(1) VALUE "B".
       01  CANVOTEFLAG      PIC 9 VALUE 0.
               88  CANVOTE        VALUE 1.
               88  CANTVOTE       VALUE 0.
       01  TESTNUMBER       PIC X.
               88  ISPRIME        VALUE "1", "3", "5", "7".
               88  ISODD          VALUE "1", "3", "5", "7", "9".
               88  ISEVEN         VALUE "2", "4", "6", "8".
               88  LESSTHAN5      VALUE "1" THRU "4".
               88  ANUMBER        VALUE "0" THRU "9".

       PROCEDURE DIVISION.
           DISPLAY "*** 1 **************"
           DISPLAY "Enter age : " WITH NO ADVANCING.
           ACCEPT AGE.

           IF AGE > 18
           THEN
               DISPLAY "You can vote"
           ELSE
               DISPLAY "You can't vote"
           END-IF.

           DISPLAY "*** 2 **************"

      *************************
      *    < LESS THAN
      *    > GREATER THAN
      *    = EQUAL TO
      *    NOT EQUAL TO
      *************************

           IF AGE LESS THAN 5
           THEN
               DISPLAY "Stay Home"
           END-IF.

           IF AGE = 5
           THEN
               DISPLAY "GO TO KINDRGARTEN"
           END-IF.
           
           IF AGE > 5 AND AGE < 18
           THEN
               COMPUTE GRADE = AGE - 5
               DISPLAY "GO TO GRADE " GRADE
           END-IF.

           IF AGE GREATER THAN OR EQUAL TO 18
           THEN
               DISPLAY "GO TO HIGH SCHOOL"
           END-IF.
           
           DISPLAY "*** 3 **************"

           IF SCORE IS PASSINGSCORE
           THEN
               DISPLAY "YOU PASSED"
           ELSE
               DISPLAY "YOU FAILED"
           END-IF.

      *    > NUMERIC, ALPHABETIC, ALPHABETIC-LOWER, ALPHABETIC-UPPER
           IF SCORE IS NOT NUMERIC
           THEN
               DISPLAY "NOT A NUMBER"
           END-IF.

           IF AGE > 18
           THEN
               SET CANVOTE TO TRUE
           ELSE
               SET CANTVOTE TO TRUE
           END-IF.

           DISPLAY "VOTE " CANVOTEFLAG.

           DISPLAY "*** 4 **************"
           DISPLAY "Enter Single Number OR X TO EXIT : "
           ACCEPT TESTNUMBER.
           PERFORM UNTIL NOT ANUMBER
               EVALUATE TRUE
                   WHEN ISPRIME
                       DISPLAY "PRIME"
                   WHEN ISODD
                       DISPLAY "ODD"
                   WHEN ISEVEN
                       DISPLAY "EVEN"
                   WHEN LESSTHAN5
                       DISPLAY "LESS THAN 5"
                   WHEN OTHER
                       DISPLAY "DEFAULT ACTION"
               END-EVALUATE

               ACCEPT TESTNUMBER
           END-PERFORM.

           STOP RUN.
