
/* Modified implementation of http://processing.org/examples/clock.html */
/* Styled to look like classic Swiss clock (Mondaine) */

/* Week 3 - Modified to act as a stopwatch */

int SIZE = 600;
int cX, cY, sec, min, hou;
float sR, mR, hR, cD;
boolean count = false;

int currentSec;

void setup()
{
  // Draw a window of size SIZE (In this case, 600x600)
  size(SIZE,SIZE);
  // Set our end caps to be square (default is rounded)
  strokeCap(SQUARE);
  frameRate(60);
  
  // Set up initial variables.
  int radius = SIZE/2;
  sR = radius * 0.82;
  mR = radius * 0.6;
  hR = radius * 0.7;
  cD = radius * 1.8;
  
  cX = width/2;
  cY = height/2;
  
  sec = 0;
  min = 0;
  hou = 0;
}

void draw()
{
  background(230);
  
  drawClockBG();
  drawTicks();
  drawHands();
  
  if (mousePressed && (mouseButton == LEFT) && !count)
  {
    count = true;
    currentSec = second();
    countTime();
  }
  else if (mousePressed && (mouseButton == LEFT) && count)
  {
    count = false;
  }
  else if (mousePressed && (mouseButton == RIGHT))
  {
    sec = 0;
    min = 0;
    hou = 0;
  }
  else if(count)
  {
    countTime();
  }
}

/* Draw the circular clock background */
void drawClockBG()
{
  stroke(180);
  strokeWeight(5);
  fill(255);
  ellipse(cX,cY,cD,cD);
}

/* Draw the markers for each minute and hour */
void drawTicks()
{
  float x,y,angle;
  // Draw the minute ticks
  beginShape(LINES);
  // Loop for every marker
  for (int a = 0; a < 360; a+=6) {
    strokeWeight(2);
    stroke(180);
    
    angle = radians(a);
    x = cX + cos(angle) * (sR+10);
    y = cY + sin(angle) * (sR+10);
    vertex(x, y);
    
    // If the marker is supposed to be an hour marker, then we want it to be bigger and thicker.
    if (a0 != 0)
    {
      x = cX + cos(angle) * sR;
      y = cY + sin(angle) * sR;
    }
    else
    {
      strokeWeight(8);
      stroke(70);
      x = cX + cos(angle) * (sR-20);
      y = cY + sin(angle) * (sR-20);
    } 
    
    vertex(x, y);
  }
  endShape();
}

void drawHands()
{
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(sec, 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(min, 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hou, 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  // Hours
  stroke(70,255);
  strokeWeight(10);
  line(cX, cY, cX + cos(h) * hR, cY + sin(h) * hR);
  
  // Minutes
  stroke(70, 200);
  strokeWeight(10);
  line(cX, cY, cX + cos(m) * (mR+60), cY + sin(m) * (mR+60));
  
  // Seconds
  strokeWeight(3);
  stroke(255,0,0, 255);
  line(cX, cY, cX + cos(s) * (sR-30), cY + sin(s) * (sR-30));
}

/* Method to count time, and update hands accordingly */
void countTime()
{
  /* Determine if a second has passed */
  if (currentSec-second() != 0)
  {
    sec++;
    currentSec = second();
  }
  
  /* Determine if a minute has passed, increment minute hand */
  if (sec` == 0 && sec > 0)
  {
    min++;
    sec = 0;
  }
  /* Determine if an hour has passed, increment hour hand */
  else if (min` == 0 && min > 0)
  {
    hou++;
    min = 0;
  }
}
