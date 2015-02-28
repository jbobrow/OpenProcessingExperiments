
// AeonX
// Carnegie Mellon University
// Electronic Media Studio II
// Section D, Professor Eric Singer
// Assignment 05, DUE 10/03/11


// Get values from the system clock:
int gSecond = second();  // values from 0 - 59
int gMinute = minute();  // values from 0 - 59
int gHour = hour();  // values from 0 - 23
  
PImage img;

void setup()
{
  size(600, 600);
  img = loadImage("ClockClouds.jpg");
  smooth();
  noStroke();
}


void draw()
{

  updateTime();  // Thank you Joel!    :)

  image(img, 0, 0, 600, 600);

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
  fill(229, 242, 255, 25);  // blue light (transparent)
  ellipse(width/2, height/2, gHour * 50, gHour * 50);
  fill(229, 242, 255, 50);  // blue light (transparent)
  ellipse(width/2, height/2, gHour * 48, gHour * 48);
  fill(229, 242, 255, 75);  // blue light (transparent)
  ellipse(width/2, height/2, gHour * 46, gHour * 46);
  fill(229, 242, 255, 75);  // blue light (transparent)
  ellipse(width/2, height/2, gHour * 42, gHour * 42);
  fill(183, 219, 255, 150);  // blue medium (transparent)
  ellipse(width/2, height/2, gHour * 40, gHour * 40);
  fill(163, 208, 252, 150);  // blue dark (transparent)
  ellipse(width/2, height/2, gHour * 38, gHour * 38);  
  fill(183, 219, 255, 150);  // blue medium (transparent)
  ellipse(width/2, height/2, gHour * 34, gHour * 34);
  fill(229, 242, 255, 150);  // blue light (transparent)
  ellipse(width/2, height/2, gHour * 30, gHour * 30);
}


void drawMinute()
{
  fill(255, 224, 250, 50);  // pink light (transparent)
  ellipse(width/2, height/2, gMinute * 5, gMinute * 5);
  fill(255, 185, 244, 50);  // pink medium (transparent)
  ellipse(width/2, height/2, gMinute * 4.75, gMinute * 4.75);
  fill(250, 68, 162, 50);  // pink dark (transparent)
  ellipse(width/2, height/2, gMinute * 4.5, gMinute * 4.5);
  fill(255, 185, 244, 50);  // pink medium (transparent)
  ellipse(width/2, height/2, gMinute * 4.25, gMinute * 4.25);
  fill(255, 224, 250, 50);  // pink light (transparent)
  ellipse(width/2, height/2, gMinute * 3.75, gMinute * 3.75);
}


void drawSecond()
{
  fill(251, 255, 147, 50);  // yellow light (transparent)
  ellipse(width/2, height/2, gSecond * 4, gSecond * 4);
  fill(243, 252, 5, 50);  // yellow medium (transparent)
  ellipse(width/2, height/2, gSecond * 3.75, gSecond * 3.75);
  fill(250, 68, 162, 50);  // pink dark (transparent)
  ellipse(width/2, height/2, gSecond * 3.5, gSecond * 3.5);  
  fill(243, 252, 5, 50);  // yellow medium (transparent)
  ellipse(width/2, height/2, gSecond * 3.25, gSecond * 3.25);
  fill(251, 255, 147, 50);  // yellow light (transparent)
  ellipse(width/2, height/2, gSecond * 3, gSecond * 3);
}


/* CREDITS...
 
 1) http://processing.org/reference/second_.html
 
 2) Casey Reas
 http://ucla.sketchpad.cc/sp/pad/view/ro.4Kf$L3A64ciwk1/rev.2
 
 3) Mucho thanks to Joel Simon for showing me how to update the time...
 And for explaining the fix so I understand.   :)
 */

