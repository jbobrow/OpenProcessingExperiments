
void crono(){
     
  int thisTime = millis();
  int dHours, dMins, dSecs, dDecimal;
   
  if (key=='/') {
     
        // clear the time and stop the clock
        accumTime= 0;
        displayTime = 0;
      
 
      
          // stop timing, but do not clear
          if (running == true) {
            
            running = false;
            accumTime = accumTime + millis() - startTime;
          
      }
    }
    if (running == true) {
          displayTime = accumTime + millis() - startTime;
    }
   
   dSecs = (displayTime / 1000) % 60;
   dMins = (displayTime / 1000 / 60) % 60;
   
     
    text(nf(dMins, 2) + ":" + nf(dSecs, 2),
      680, 480);
}
void crono2(){
   int thisTime = millis();
  int dHours, dMins, dSecs, dDecimal;
   
  if (key=='/') {
     
        // clear the time and stop the clock
        accumTime= 0;
        displayTime = 0;
      
 
      
          // stop timing, but do not clear
          if (running == true) {
            
            running = false;
            accumTime = accumTime + millis() - startTime;
          
      }
    }
    if (running == true) {
          displayTime = accumTime + millis() - startTime;
    }
   
   dSecs = (displayTime / 1000) % 60;
   dMins = (displayTime / 1000 / 60) % 60;
   
     textSize(62);
    text(nf(dMins, 2) + ":" + nf(dSecs, 2),
      180, 400);
  
  
}




