
     
    //Jonathan Minard -- Doomsday clock
    
    import java.text.SimpleDateFormat;
    import java.util.Calendar;
    import java.util.Date;
   
     String doomsday = "December 21, 2012";
     String endTime = " 00:00:01";
     int endYear = 2012;
     int endMonth = 12;
     int endDay = 21;
   
     int currentMonth;
     int currentYear;
     int currentDay;
     String[] moon = new String[12];
     Calendar now = Calendar.getInstance();
       
     int currentMinutes;
     long currentSeconds;
     int countDown;
     int countDownSeconds; 
     
     int yearsRemaining;
     int daysRemaining;
     int secondsRemaining;
     
     int numhour;
     int numminute;
     int numsecond;
     
     int secondsPerDay = 86400;
     int secondsPerYear = 31556926;
     
     float originX;
     float originY;
     float spacing = 45;
     int fontSize = 90;
     
     
     void setup() {
       
       size(790, 420, P2D);
       stroke(3);
       background(0, 0, 0);
       
       monthArray();  
      
       findDate();
       
       originX = width * .12;
       originY = height * .20;
       
        // Create the font
       
       textAlign(LEFT, LEFT);
       
     } 

     void draw() {
       
       background(0,0,0);
    
       findDate();
       writeDate();
      // writeTime();
       writeEndTime();
       
       /* stroke(0, 255, 0);
       line (originX, 0, originX, height);
       
       stroke(255, 0, 200);
       line (originX + 300, 0, originX + 300, height);
       */
       
       // writeTime();
       
     }
     
      void findDate() { 
        
         Date now = Calendar.getInstance().getTime();
       //  println("Current date and time is: " + now);
       
        }
       
       
     void writeDate (){
       
       textFont(createFont("DS-Digital", fontSize));
       fill(140, 0, 20);
       
      
       // write "current" and "end"
     //  textFont(createFont("DS-Digital", 50));
    //   text ("now", originX - 200, originY);
     //  textFont(createFont("DS-Digital", 50));
     //  text ("end", originX - 200, originY + 200);
       
        // current date
       textFont(createFont("DS-Digital", fontSize));
       text (moon[now.get(Calendar.MONTH)], originX , originY);
       text (now.get(Calendar.DAY_OF_MONTH), originX + 175  , originY);
       text (now.get(Calendar.YEAR), originX + 300, originY);
       
       // end date
       text (moon[endMonth-1], originX, originY + 200);
       text (endDay, originX + 175  , originY +200);
       text (endYear, originX + 300 , originY + 200) ;
       
     }    
     
     void writeTime (){
       
        textFont(createFont("DS-Digital", fontSize));
        fill (255, 0, 25);
  
        
        text (": " , originX + 175 - 25 , originY + 100);
        text (": " , originX + 300 - 25 , originY + 100);   
        text (": " , originX + 400 , originY + 100); 
        text (": " , originX + 175 - 25 , originY + 300);
        text (": " , originX + 300 - 25 , originY + 300); 
        text (": " , originX + 400 , originY + 300);  
        
        fill (40, 0, 5);
       
        text (8, originX + 50, originY + 100 );
        text (8, originX + 50 + spacing, originY + 100);      
        text (8, originX + 175, originY + 100);
        text (8, originX + 175  + spacing, originY + 100); 
        text (8, originX + 300, originY + 100);
        text (8, originX + 300 + spacing, originY + 100);
        text (8, originX +425 + spacing*2, originY + 100);
        text (8, originX + 425 + spacing, originY + 100);
        text (8, originX + 425, originY + 100);
        text (8, originX - 120, originY + 300);
        text (8, originX + 50, originY + 300 );
        text (8, originX + 50 + spacing, originY + 300); 
        text (8, originX + 170, originY +300);
        text (8, originX + 175 + spacing, originY + 300);
        text (8, originX + 300, originY + 300);
        text (8, originX + 300 + spacing, originY +300);
        text (8, originX +425 + spacing*2, originY +300);
        text (8, originX + 425 + spacing, originY + 300);
        text (8, originX + 425, originY + 300);
       
       
        fill (255, 0, 25);
        text (hour()/10, originX + 50, originY + 100 );
        text (hour() % 10, originX + 50 + spacing, originY + 100);      
        text (minute()/10, originX + 175, originY + 100);
        text (minute()% 10, originX + 175  + spacing, originY + 100); 
        text (second()/10, originX + 300, originY + 100);
        text (second()% 10, originX + 300 + spacing, originY + 100);
        int milscount = millis()%1000;
        int milsone = milscount%10;
        int milsten = (milscount%100 - milsone)/10;
        int milshundred = (milscount%1000 - milscount%100)/100;
       
        text (milsone, originX +425 + spacing*2, originY + 100);
        text (milsten, originX + 425 + spacing, originY + 100);
        text (milshundred, originX + 425, originY + 100);
       
        }
       
     void writeEndTime (){
       
       
         // println(doomsday);
          // set endDate -- inputs string, sets default end time to midnight
          Date endDate = new Date(doomsday + endTime);   
          DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

          // calls current date 
          Date now =  new Date();
        
          //Is the end date in the future? if true
          
          if (endDate.getTime() > now.getTime()){
           
          writeTime(); // write the current time
          long  diff = (endDate.getTime() - now.getTime()); //calculate the remaining time in milliseconds
          long currentSeconds = diff/ 1000; // convert milliseconds to seconds
      
       //  
          int hoursLeft = int (currentSeconds/60/60); // - (daysLeft*24);
          int currentMinutes = int (currentSeconds / 60);
          int minutesLeft = int (currentMinutes - ((hoursLeft*60)));
          int secondsLeft = int (currentSeconds - (hoursLeft*60*60)+(minutesLeft*60));
          
          int daysLeft = int (hoursLeft/24);
          hoursLeft = hoursLeft - (daysLeft*24);
           //remainder of total seconds divided by 60
          int currentIntSeconds = int (currentSeconds % 60);
          
          // Test accuracy of time difference calculation
          fill(255, 0, 25);
         
         //draw current time remaining
        
          textFont(createFont("DS-Digital", fontSize));
          text (daysLeft, originX - 75, originY + 300);
          text (hoursLeft/10, originX + 50, originY + 300 );
          text (hoursLeft%10, originX + 50 + spacing, originY + 300); 
          text (minutesLeft/10, originX + 170, originY +300);
          text (minutesLeft%10, originX + 175 + spacing, originY + 300);
          textFont(createFont("DS-Digital", 50));
         // text ("min", originX + 230, originY-100);  
        
        //draw time remaining
          textFont(createFont("DS-Digital", fontSize));
          text (currentIntSeconds/10, originX + 300, originY + 300);
          text (currentIntSeconds%10, originX + 300 + spacing, originY +300);
          
          long milliscount = diff%1000;
          int millisone = int(milliscount%10);
          int millisten = int(milliscount%100 - millisone)/10;
          int millishundred = int(milliscount%1000 - milliscount%100)/100;
       
          text (millisone, originX +425 + spacing*2, originY +300);
          text (millisten, originX + 425 + spacing, originY + 300);
          text (millishundred, originX + 425, originY + 300);
          
        //  println (millishundred + ("   ") + millisten + ("  " ) +  millisone );
          
          fill(120, 0, 15);
          textFont(createFont("DS-Digital", 30));
          text ("remaining", originX + 560, originY +300); 
          text ("days", originX - 55 + spacing, originY +300); 
         
          
          }
          
          
          if (endDate.getTime() <= now.getTime()){
          background(0,0,0);
          textFont(createFont("DS-Digital", fontSize));
          fill(255, 255, 255);
          text ("END" , originX, originY);
          text (": " , originX + 175 - 25 , originY + 100);
          text (": " , originX + 300 - 25 , originY + 100);   
           
               
          text (0, originX + 50 , originY + 100 );
          text (0, originX + 50 + spacing, originY + 100);      
          text (0, originX + 175, originY + 100);
          text (0, originX + 175  + spacing, originY + 100); 
          text (0, originX + 300, originY + 100);
          text (0, originX + 300 + spacing, originY + 100);
            
          }
     }      
        
      
    
       void monthArray() {
       
      moon[0] = "JAN";    
      moon[1] = "FEB";
      moon[2] = "MAR";
      moon[3] = "APR";
      moon[4] = "MAY";
      moon[5] = "JUN";
      moon[6] = "JUL";
      moon[7] = "AUG";
      moon[8] = "SEP";
      moon[9] = "OCT";
      moon[10] = "NOV";
      moon[11] = "DEC";
       
     }
     
      
     
    

