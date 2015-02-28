
// ADC Analogic Digital Clock Version 1.2
// Modification de la version originale que je numérote 1.0
// Version 1.2 : avec la date et le jour de la semaine


// Clock by Charles Cave - 6th August 2010 
// charles.cave@gmail.com 

PFont font;
PImage bgImage;   // the image of the clock face
String [] mois = {"janvier","février","mars","avril","mai","juin","juillet","août","septembre","octobre","novembre","décembre"};

// coordinates of centre of clock dial - work this out by
// examining the image with GIMP

// clockface.png details
int xCentre = 122;
int yCentre = 131;
int hourHand = 60;   // length of hour  hand
int minHand = 90;   // length of minute  hand
int secHand = 96;   // length of second hand
int digClockRow = 280;  //  Row of Digital Clock

DatePlus DP;


///////////////
void setup() {
////////////////
 size(249,320,P2D);   // the size of the clockface image
 bgImage = loadImage("clockface.png");
 frameRate(1);    // one refresh per second is sufficient
 font = loadFont("font.vlw");
 textFont(font, 24);
 textAlign(CENTER); 
 
 smooth();
 fill(#14C927); 
 
 DP = new DatePlus();
}

//////////////
void draw() {
//////////////
  
  float endX, endY;
  background(0);
  image(bgImage,0,0);
  
  // Write the digital time
  fill(#14C927); 
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
  stroke(#F5700A, 128);  // orange
  strokeWeight(6);
  line(xCentre, yCentre, endX, endY);
  
  // draw the minute hand - location adjusted by the seconds
  float minuteAmt = minute();
  minuteAmt += second() / 60.0;
  endX = xCentre + minHand * sin(radians(map(minuteAmt, 0, 60, 0, 360)));
  endY = yCentre - minHand * cos(radians(map(minuteAmt, 0, 60, 0, 360)));
  stroke(#3A7BD3, 188);  //bleu
  strokeWeight(4);
  line(xCentre, yCentre, endX, endY);
  
  // draw the second hand
 float MSeconds;
 MSeconds = second() ; 
 endX = xCentre + secHand * sin(radians(map(MSeconds, 0, 60, 0, 360)));
 endY = yCentre - secHand * cos(radians(map(MSeconds, 0, 60, 0, 360)));
 stroke(#F5240C, 188);  
 strokeWeight(2);
 line(xCentre, yCentre, endX, endY);
 
 fill(#4995F0);
 textSize(20);
 text(DP.dayWord()+" "+day()+" "+DP.monthWord()+" "+year(), width/2, digClockRow+30);
 textSize(24);
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


