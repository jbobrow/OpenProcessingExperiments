
//  Title: Rotating Ribbon
//  Description: A ribbon rotates and ripples in the darkness
//  Date Started: 2012 Mar 09
//  Last Modified: 2012 Mar 09
//  http://asymptoticdesign.wordpress.com/
//  This work is licensed under a Creative Commons 3.0 License.
//  (Attribution - NonCommerical - ShareAlike)
//  http://creativecommons.org/licenses/by-nc-sa/3.0/
//
//  In summary, you are free to copy, distribute, edit, and remix the work.
//  Under the conditions that you attribute the work to me, it is for
//  noncommercial purposes, and if you build upon this work or otherwise alter
//  it, you may only distribute the resulting work under this license.
//
//  Of course, the conditions may be waived with permission from the author.
//

//-----------------Globals
/* These are variables that you want to exist throughout the entire sketch.*/
float r = 150;
float theta = 0;
float theta_vel = 0.02;
float rad_vel = 7;
float centX, centY;
float radNoise;

//-----------------Setup
/*The code in setup() will only be run once in your sketch.  Use this space to set things up like
 the sketch size, background color, framerate, etc. etc.*/
void setup() {
  //setup the sketch parameters
  background(0);
  size(500, 500);
  frameRate(30);
  smooth();
  centX = width/2;
  centY = height/2;
  //seed noises
  radNoise = random(17);
}

//-----------------Main Loop
void draw() {
  fill(0,2);
  rect(0,0,width,height);
  //increment noise
  radNoise += 0.1;
  r += (noise(radNoise) - 0.5)*rad_vel;
  theta += theta_vel;
  centX += 2*noise(theta) - 1;
  centY += 2*noise(theta) - 1;
  float x1 = r*cos(theta) + centX;
  float y1 = r*sin(theta) + centY;
  float x2 = -r*cos(theta) + centX;
  float y2 = -r*sin(theta) + centY;
  //setup the parameters for drawign the ellipse
  stroke(255*noise(radNoise),255,255*noise(radNoise));
  //draw the ellipse
  line(x1,y1,x2,y2);
  //update the position for the next frame
}

void mousePressed() {
  saveFrame("ribbon.png");
}

