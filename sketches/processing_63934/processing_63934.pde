
//  Title: Polygonal Flowers
//  Description: Draw flower-like shapes utilizing stacked concentric polygons.
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
int numPoints = 4;
int theta = 6;
String timestamp;
//-----------------Setup
/*The code in setup() will only be run once in your sketch.  Use this space to set things up like
the sketch size, background color, framerate, etc. etc.*/
void setup(){
  size(512,512);
  background(0);
  stroke(255);
  fill(0);
  smooth();
  frameRate(30);
  rectMode(CENTER);  
  translate(width/2,height/2);
  for(int side = 256; side > 25; side -= 10) {
    rotate(TWO_PI/theta);
    polygon(side,numPoints);
  }
}

//-----------------Main Loop
/*This is the main loop of your sketched.  This loop gets called over and over again until you quit the sketch.*/
void draw(){
  translate(width/2,height/2);
  for(int side = 256; side > 25; side -= 10) {
    rotate(TWO_PI/theta);
    polygon(side,numPoints);
  }
}

//-----------------Interactions
void keyPressed() {
  if (key == ' ') {
      timestamp = year() + nf(month(),2) + nf(day(),2) + "-"  + nf(hour(),2) + nf(minute(),2) + nf(second(),2);
      saveFrame(timestamp+".png");

  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      background(0);
      numPoints += 1;
    }
    if (keyCode == DOWN) {
      background(0);
      numPoints -= 1;
    }
    if (keyCode == RIGHT) {
      background(0);
      theta -= 1;
    }
    if (keyCode == LEFT) {
      background(0);
      theta += 1;
    }

  }   
}


//-----------------Defined Functions
void polygon(float rad, int numPoints) {
  float theta = TWO_PI / numPoints;
  beginShape();
  for (int i = 0; i < numPoints; i++) {
      float x = cos(i*theta)*rad;
      float y = sin(i*theta)*rad;
      vertex(x,y);
  }
  endShape(CLOSE); 
}

void star(float innerSize, float outerSize, int numPoints) {
  float theta = PI / numPoints;
  beginShape();
  for (int i = 0; i < 2*numPoints; i++) {
    if(i % 2 == 0) {
      float x = cos(i*theta)*outerSize;
      float y = sin(i*theta)*outerSize;
      vertex(x,y);
    } else {
      float x = cos(i*theta)*innerSize;
      float y = sin(i*theta)*innerSize;
      vertex(x,y);
    }    
  }
  endShape(CLOSE); 
}

//-----------------Defined Classes
/*Place any defined classes here.  We'll go over this later*/

