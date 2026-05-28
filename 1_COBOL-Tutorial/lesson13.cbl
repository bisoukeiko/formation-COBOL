       IDENTIFICATION DIVISION.
       PROGRAM-ID. LESSON13.
       AUTHOR. BISOU.
       DATE-WRITTEN. 22-05-2026.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUSTOMERREPORT ASSIGN TO "CustReport.rpt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT CUSTOMERFILE ASSIGN TO "Customer.dat"
               ORGANIZATION IS LINE SEQUENTIAL.
       
       DATA DIVISION.
       FILE SECTION.
       FD  CUSTOMERREPORT.
       01  PRINTLINE              PIC X(44).

       FD  CUSTOMERFILE.
       01  CUSTOMERDATA.
           03  IDNUM              PIC 9(5).
           03  CUSTNAME.
               05  FIRSTNAME      PIC X(15).
               05  LASTNAME       PIC X(15).
           88  WSEOF              VALUE HIGH-VALUE.

       WORKING-STORAGE SECTION.
       01  PageHeading.
           03  FILLER             PIC X(13) VALUE 'Customer List'.
       01  PageFooting.
           03  FILLER             PIC X(13) VALUE SPACE.
           03  FILLER             PIC X(7)  VALUE 'Page : '.
           03  PrnPageNum         PIC Z9.
       01  Heads    PIC X(36) VALUE 'IDNUM   FIRSTNAME       LASTNAME'.
       01  CustomerDetailLine.
           03  FILLER             PIC X VALUE SPACE.
           03  PrnCustID          PIC 9(5).
           03  FILLER             PIC X(4) VALUE SPACE.
           03  PrnFirstName       PIC X(15).
           03  FILLER             PIC X(2) VALUE SPACE.
           03  PrnLastName        PIC X(15).
       01  ReportFooting          PIC X(13) VALUE 'END OF REPORT'.
       01  LineCNT                PIC 99 VALUE ZERO.
           88 NewPageRequired VALUE 40 THRU 99.
       01  PageCNT                PIC 99 VALUE ZERO.


       PROCEDURE DIVISION.
           OPEN INPUT CUSTOMERFILE.
           OPEN OUTPUT CUSTOMERREPORT.
       
           PERFORM PRINTPAGEHEADING.
       
           READ CUSTOMERFILE
               AT END SET WSEOF TO TRUE
           END-READ.
    
           PERFORM PRINTREPORTBODY UNTIL WSEOF.
    
           WRITE PrintLine FROM ReportFooting AFTER ADVANCING 5 LINES.          


           CLOSE CUSTOMERFILE.
           CLOSE CUSTOMERREPORT.
    
           STOP RUN.
    

       PRINTPAGEHEADING.
           WRITE PrintLine FROM PageHeading AFTER ADVANCING PAGE.
           WRITE PrintLine FROM Heads AFTER ADVANCING 5 LINES.
           MOVE 3 TO LineCNT.
           ADD 1 TO PageCNT.

       PRINTREPORTBODY.
           IF NewPageRequired
               MOVE PageCNT TO PrnPageNum
               WRITE PrintLine FROM PageFooting AFTER ADVANCING 5 LINES
               PERFORM PRINTPAGEHEADING
           END-IF.

           MOVE IDNum TO PrnCustID.
           MOVE FirstName TO PrnFirstName.
           MOVE LastName TO PrnLastName.
           WRITE PrintLine 
               FROM CustomerDetailLine AFTER ADVANCING 1 LINE.
           ADD 1 TO LineCNT.

           READ CUSTOMERFILE
               AT END SET WSEOF TO TRUE
           END-READ.
