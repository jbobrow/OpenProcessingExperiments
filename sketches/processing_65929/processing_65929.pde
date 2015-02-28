
//  Title: Data Visualization:
//  Description: Maps value of perlin noise is 2d space to the angle of a line.
//  Date Started: Jan 2012
//  Last Modified: Jul 2012
//  http://www.asymptoticdesign.org/
//  This work is licensed under a Creative Commons 3.0 License
//  (Attribution - NonCommerical - ShareAlike)
//  http://creativecommons.org/licenses/by-nc-sa/3.0/
//  
//  In summary, you are free to copy, distribute, edit, and remix the work.
//  Under the conditions that you attribute the work to me, it is for
//  noncommercial purposes, and if you build upon this work or otherwise alter
//  it, you may only distribute the resulting work under this license.
//
//  Of course, the conditions may be waived with permission from the author.

//-----------------Globals
float delta = 0.05;
float xnoise = 0;
float ynoise = 0;
float xstart = 0;
float ystart = 0;
float znoise = 0; 
float len = 0;
float r = 20;

//-----------------Setup
void setup(){
  size(800,600);
  background(0);
  stroke(0,255,0,128);
  smooth();
  frameRate(30);
  xstart = random(17);
  ystart = random(17);
  znoise = random(17);
  xnoise = xstart;
  ynoise = ystart;
  for(int x = 0; x < width; x+=5){
    ynoise += delta;
    xnoise = xstart;
    for(int y = 0; y < height; y+=5){
      xnoise += delta;
      float angle = TWO_PI*noise(xnoise,ynoise,znoise);
      line(x,y,x+r*cos(angle),y+r*sin(angle));
    }
  }
}

//-----------------Main Loop
void draw() {
  background(0);
  xnoise = xstart;
  ynoise = ystart;
  znoise += 0.01;
  for(int x = 0; x < width; x+=5){
    ynoise += delta;
    xnoise = xstart;
    for(int y = 0; y < height; y+=5){
      xnoise += delta;
      float angle = TWO_PI*noise(xnoise,ynoise,znoise);
      line(x,y,x+r*cos(angle),y+r*sin(angle));
    }
  }
}

//-----------------Interactions
void keyPressed() {
  if (key == ' ') {
    saveFrame("angles-####.png");
  }
}

