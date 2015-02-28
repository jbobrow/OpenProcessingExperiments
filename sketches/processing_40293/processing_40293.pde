
// AeonX
// Carnegie Mellon University
// Electronic Media Studio II
// Section D, Professor Eric Singer
// Assignment 05, DUE 10/03/11


// Get values from the system clock:
int gSecond = second();  // values from 0 - 59
int gMinute = minute();  // values from 0 - 59
int gHour = hour();  // values from 0 - 23
  
PImage imgBackground;

PImage imgMandalaHour;
PImage imgMandalaMinute;
PImage imgMandalaSecond;

void setup()
{
  size(600, 600);
  imgBackground = loadImage("ClockClouds.jpg");
  
  imgMandalaHour = loadImage("Mandala01Snake.gif");
  imgMandalaMinute = loadImage("Mandala02Moth.gif");
  imgMandalaSecond = loadImage("Mandala03Snake.gif");
  
  imageMode(CENTER);
  
  smooth();
  noStroke();
}


void draw()
{

  updateTime();  // Thank you Joel!    :)

  image(imgBackground, 300, 300, 600, 600);
  
  // If it is after noon, subtract 12 hours:
  if (gHour > 12) {
    gHour -= 12;
  }

  drawHour();
  drawMinute();
  drawSecond();
}


void updateTime()
{
  gSecond = second();  // values from 0 - 59
  gMinute = minute();  // values from 0 - 59
  gHour = hour();  // values from 0 - 23
}


void drawHour()
{
  image(imgMandalaHour, width/2, height/2, gHour * 100, gHour * 100);
}


void drawMinute()
{
  image(imgMandalaMinute, width/2, height/2, gMinute * 10, gMinute * 10);
}


void drawSecond()
{
  image(imgMandalaSecond, width/2, height/2, gSecond * 10, gSecond * 10);
}


/* CREDITS...
 
 1) http://processing.org/reference/second_.html
 
 2) Casey Reas
 http://ucla.sketchpad.cc/sp/pad/view/ro.4Kf$L3A64ciwk1/rev.2
 
 3) Mucho thanks to Joel Simon for showing me how to update the time...
 And for explaining the fix so I understand.   :)
 */

