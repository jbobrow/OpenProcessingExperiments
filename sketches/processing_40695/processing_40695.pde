
int hours;
int minutes;
int seconds;
PFont myFont;


color off = color(51, 104, 107);
color on = color(4, 176, 186);
color backg = color(20, 30, 40);

void setup() {
    size(900, 450);
    background(150);
}

void draw() {
   background(backg);
   noStroke();
   
   // Set system variables
   hours = hour();
   minutes = minute();
   seconds = second();
   
   // AM/PM
   if (hours > 12) {
     String ampm = "PM";
   } else {
     String ampm = "AM";
   }
   
   // 24-hour adjustment
   if (hours > 12) {
     hours -= 12;
   }
   
   // Typography
   fill(255);
   myFont = createFont("HelveticaNeue-Bold", 30);
   textFont(myFont);
   String clocktype = hours + ":" + minutes + ":" + seconds + " ";
   text (clocktype, 750, 80);
   
   println(hours + " " + minutes + " " + seconds);
   
   // HOURS
     int hXpos = 37;                            //hours x start point
     int hCount = 0;                            //hours counter
     int hBor = 35;                             //hours "border"
     int hMarker = ((70 * hours) + hXpos);      //hour marker start point
     
     // Hour bars
     fill(off);
     for (int i = hXpos; i <= 840; i += 70) {       // 12 * 70 = 840
       rect(i, 120, 66, 190);
     }
     
     // Hour marker
     fill(on);
     rect(hMarker, 120, 66, 190);
     
     
   // MINUTES
     int mXpos = 37;                            //minutes x start point
     int mCount = 0;                            //minutes counter
     float mMarker = ((14.5 * minutes) + mXpos);      //minutes marker start point
     
     // Minute bars
     fill(255);
     for (int i = mXpos; i <= 870; i += 14.5) {       // 60 * 14.5 = 870
       rect(i, 350, 10, 90);
     }
     
     // Minute marker
     fill(0);
     rect(mMarker, 350, 10, 90);
     
     
     // SECONDS
     int sXpos = 37;                            //seconds x start point
     int sCount = 0;                            //seconds counter
     float sMarker = ((14.6 * seconds) + sXpos);      //seconds marker start point
     
     // Second bars
     fill(255);
     for (int i = sXpos; i <= 870; i += 14.5) {       // 60 * 14.5 = 870
       rect(i, 320, 10, 20);
     }
     
     // Second marker
     fill(0);
     rect(sMarker, 320, 10, 20);
   
 text ("PM", 50, 50);
}

