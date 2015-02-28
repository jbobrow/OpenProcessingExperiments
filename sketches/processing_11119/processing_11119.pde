
// Clock by Charles Cave - 6th August 2010 
// charles.cave@gmail.com 

PFont font;
PImage bgImage;   // the image of the clock face

// coordinates of centre of clock dial - work this out by
// examining the image with GIMP

// clockface.png details
int xCentre = 122;
int yCentre = 131;
int hourHand = 60;   // length of hour  hand
int minHand = 90;   // length of minute  hand
int secHand = 96;   // length of second hand
int digClockRow = 280;  //  Row of Digital Clock

//////////////
void draw() {
//////////////
  
  float endX, endY;
  background(bgImage);
  
  // Write the digital time
  text(hour() + ":" + paddedNumber(minute()) + ":" + paddedNumber(second()), 
      width/2, digClockRow);
  
  // draw the hour hand
  float  hour12 = hour();
  if (hour12 > 12) {
     hour12 -= 12;
  }
  // the hour hand needs to be advanced in proportion to how many minutes have elapsed
  hour12 += minute() / 60.0;
  endX = xCentre + hourHand * sin(radians(map(hour12, 0, 12, 0, 360)));
  endY = yCentre - hourHand * cos(radians(map(hour12, 0, 12, 0, 360)));
  stroke(0, 128);  // black
  strokeWeight(6);
  line(xCentre, yCentre, endX, endY);
  
  // draw the minute hand - location adjusted by the seconds
  float minuteAmt = minute();
  minuteAmt += second() / 60.0;
  endX = xCentre + minHand * sin(radians(map(minuteAmt, 0, 60, 0, 360)));
  endY = yCentre - minHand * cos(radians(map(minuteAmt, 0, 60, 0, 360)));
  stroke(0, 128);  // black
  strokeWeight(4);
  line(xCentre, yCentre, endX, endY);
  
  // draw the second hand
 float MSeconds;
 MSeconds = second() ; 
 endX = xCentre + secHand * sin(radians(map(MSeconds, 0, 60, 0, 360)));
 endY = yCentre - secHand * cos(radians(map(MSeconds, 0, 60, 0, 360)));
 stroke(175, 32, 58, 188);  
 strokeWeight(2);
 line(xCentre, yCentre, endX, endY);
}

////////////////////////////
String paddedNumber(int num) {
   // converts a number between 0 and 60 to a string with leading zero
   String prefix;
   if (num < 10) {
      prefix = "0";
  } else {
      prefix = "";
  }
  return prefix + num;
}

///////////////
void setup() {
////////////////
 size(249,291);   // the size of the clockface image
 bgImage = loadImage("clockface.png");
 frameRate(1);    // one refresh per second is sufficient
 font = loadFont("LucidaConsole-28.vlw");
 textFont(font, 24);
 textAlign(CENTER); 
 
 smooth();
 fill(130);
}

