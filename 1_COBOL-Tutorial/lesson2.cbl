       IDENTIFICATION DIVISION.
       PROGRAM-ID. leson2.
       AUTHOR. BISOU.
       DATE-WRITTEN. 19 mai 2026.
       ENVIRONMENT DIVISION.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION. 
       01  SAMPLEDATA          PIC X(10) VALUE "Stuff".
       01  JUSTLETTERS         PIC AAA VALUE "ABC".
       01  JUSTNUMS            PIC 9(4) VALUE 1234.
       01  SIGNEDINT           PIC S9(4) VALUE -1234.
       01  PAYCHECK            PIC 9(4)V99 VALUE ZEROS.

       01 CUSTOMER.
          03  IDENT            PIC 9(3).
          03  CUSTNAME         PIC X(20).
          03  DATEOFBIRTH.
              05  MOB          PIC 99.
              05  DOB          PIC 99.
              05  YOB          PIC 9(4).
       01  NUM1                PIC 9 VALUE 5.
       01  NUM2                PIC 9 VALUE 4.
       01  NUM3                PIC 9 VALUE 3.
       01  ANS                 PIC S99V99 VALUE 0.
       01  REM                 PIC 9V99.

       PROCEDURE DIVISION.
           MOVE "More Stuff" TO SAMPLEDATA.
           MOVE "123" TO SAMPLEDATA.
           MOVE 123 to SAMPLEDATA.
           DISPLAY SAMPLEDATA.
           DISPLAY PAYCHECK.
           MOVE "123Bob Smith           12211974" TO CUSTOMER.
           DISPLAY CUSTNAME.
           DISPLAY MOB "/" DOB "/" YOB.

           DISPLAY "* 1 ***************************".

           MOVE ZERO TO SAMPLEDATA.
           DISPLAY SAMPLEDATA.
           
           MOVE SPACE TO SAMPLEDATA.
           DISPLAY SAMPLEDATA.
           
           MOVE HIGH-VALUE TO SAMPLEDATA.
           DISPLAY SAMPLEDATA.
           
           MOVE LOW-VALUE TO SAMPLEDATA.
           DISPLAY SAMPLEDATA.

           MOVE QUOTE TO SAMPLEDATA.
           DISPLAY SAMPLEDATA.

           MOVE ALL "2" TO SAMPLEDATA.
           DISPLAY SAMPLEDATA.

           DISPLAY "* 2 ***************************".

           ADD NUM1 TO NUM2 GIVING ANS.
           DISPLAY ANS.

           SUBTRACT NUM1 FROM NUM2 GIVING ANS.
           DISPLAY ANS.

           MULTIPLY NUM1 BY NUM2 GIVING ANS.
           DISPLAY ANS.

           DIVIDE NUM1 INTO NUM2 GIVING ANS.
           DISPLAY ANS.

           DIVIDE NUM1 INTO NUM2 GIVING ANS REMAINDER REM.
           DISPLAY "Remainder " REM.

           DISPLAY "* 3 ***************************".

           ADD NUM1, NUM2 TO NUM3 GIVING ANS.
           DISPLAY ANS.
           ADD NUM1, NUM2, NUM3 GIVING ANS.
           DISPLAY ANS.

           DISPLAY "****************************".

           COMPUTE ANS = NUM1 + NUM2.
           DISPLAY ANS.

           COMPUTE ANS = NUM1 - NUM2.
           DISPLAY ANS.

           COMPUTE ANS = NUM1 * NUM2.
           DISPLAY ANS.

           COMPUTE ANS = NUM1 / NUM2.
           DISPLAY ANS.

           COMPUTE ANS = NUM1 ** 2.
           DISPLAY ANS.

           COMPUTE ANS = (3 + 5) * 5.
           DISPLAY ANS.

           COMPUTE ANS = 3 + 5 * 5.
           DISPLAY ANS.

           COMPUTE ANS ROUNDED = 3.0 + 2.005.
           DISPLAY ANS. 



           STOP RUN.
       