
// Timeflow analog clock by Sergio Albiac.
// Analog clock code taken from:
// Clock by Charles Cave - 6th August 2010
// charles.cave@gmail.com

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

float t=0;
float d=0;
float vel=1;
float acc=0;
int s=0;
int m=0;
int h=0;

//////////////
void draw() {
  //////////////

  float endX, endY;
  background(bgImage);

  // draw the hour hand
  float  hour12 = h;
  if (hour12 > 12) {
    hour12 -= 12;
  }
  // the hour hand needs to be advanced in proportion to how many minutes have elapsed
  hour12 += m / 60.0;
  endX = xCentre + hourHand * sin(radians(map(hour12, 0, 12, 0, 360)));
  endY = yCentre - hourHand * cos(radians(map(hour12, 0, 12, 0, 360)));
  stroke(0, 128);  // black
  strokeWeight(6);
  line(xCentre, yCentre, endX, endY);

  // draw the minute hand - location adjusted by the seconds
  float minuteAmt = m;
  minuteAmt += s / 60.0;
  endX = xCentre + minHand * sin(radians(map(minuteAmt, 0, 60, 0, 360)));
  endY = yCentre - minHand * cos(radians(map(minuteAmt, 0, 60, 0, 360)));
  stroke(0, 128);  // black
  strokeWeight(4);
  line(xCentre, yCentre, endX, endY);

  // draw the second hand
  float MSeconds;
  MSeconds = s;
  endX = xCentre + secHand * sin(radians(map(MSeconds, 0, 60, 0, 360)));
  endY = yCentre - secHand * cos(radians(map(MSeconds, 0, 60, 0, 360)));
  stroke(175, 32, 58, 188); 
  strokeWeight(2);
  line(xCentre, yCentre, endX, endY);

  /////// Timeflow clock workings:

  //Compute time flow using perlin noise. Constants have been hand-tuned to get desired behaviour
  acc=(0.2*noise(t)-0.1);
  t+=0.003;
  vel+=acc;
  vel=max(0.05,vel);
  vel=min(5,vel);
  d=d+vel;

  //Constrain hours, minutes and seconds between conventional ranges
  if (d>9) {
    d=0;
    s++;
  }
  if (s>59) {
    s=0;
    m++;
  }
  if (m>59) {
    m=0;
    h++;
  }
  if (h>23) {
    h=0;
  }
}


///////////////
void setup() {
  ////////////////
  size(249,291,P2D);   // the size of the clockface image
  bgImage = loadImage("clockface.png");
  //frameRate(1);    // one refresh per second is sufficient

  h = hour();
  m = minute();
  s = second();

  smooth();
  fill(130);
}


