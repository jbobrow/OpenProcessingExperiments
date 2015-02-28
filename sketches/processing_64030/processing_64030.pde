
//  Title: Lattice Walk
//  Description: 
//  Date Started: 2012 Jun
//  Last Modified: 2012 Jun
//  http://www.asymptoticdesign.org/
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

//-----------------Globals
/* These are variables that you want to exist throughout the entire sketch.*/
int stepSize = 24;
int dir = 4;
float x,y;
float prevX, prevY;

//-----------------Setup
/*The code in setup() will only be run once in your sketch.  Use this space to set things up like
the sketch size, background color, framerate, etc. etc.*/
void setup() {
  size(512,512);
  background(0);
  stroke(255);
  fill(0,8);
  smooth();
  frameRate(30);
  x = width/2;
  prevX = x;
  y = height/2;
  prevY = y;
}

//-----------------Main Loop
/*This is the main loop of your sketched.  This loop gets called over and over again until you quit the sketch.*/
void draw() {
  rect(0,0,width,height);
  float theta = TWO_PI/dir*floor(random(dir));
  x += cos(theta)*stepSize;
  y += sin(theta)*stepSize;
  if (x < 0 || x > width) {
    x = prevX;
    y = prevY;
  }
  if (y < 0 || y > height) {
    x = prevX;
    y = prevY;
  }
  strokeWeight(5);
  point(x,y);
  strokeWeight(1);
  line(x,y,prevX,prevY);
  prevX = x;
  prevY = y;
}

//-----------------Interactions
void keyPressed() {
  if (key == ' ') {
      saveFrame("latticeWalk-###.png");
  }
  if (key == CODED) {
    if (keyCode == UP) {
      background(0);
      dir += 1;
    }
    if (keyCode == DOWN) {
      background(0);
      dir -= 1;
    }
  }   
}

//-----------------Defined Functions


//-----------------Defined Classes
/*Place any defined classes here.  We'll go over this later*/

