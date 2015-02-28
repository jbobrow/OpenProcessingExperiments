
/*****************************************
 * Assignment 03
 * Name:         Shuyi Lin
 * E-mail:       slin01@brynmawr.edu
 * Course:       CS 110 - Section 02
 * Submitted:    2/14/2012
 * 
 *I decided to draw an abstract version of the night sky with different color stars. 
 There are purple stars, blue stars and yellow stars created by functions of ellipses. 
 I also added the four point stars and more colored ellipses to create an illusion of the 
 stars twinkling. There is also the option to stop the loop when mouse is pressed.
 ***********************************************/

int i=0;

void setup () {
  size (600, 600);
  background (0);
  smooth ();
  noStroke ();

  for (i=0; i<=60; i+=8) {
    int x=width;
    int y=height;

    //random blue, purple and yellow ellipses to create stars 
    drawBlueEllipses (random (x), random (y), i, i, 1.5);
    drawBlueEllipses (random (x), random (y), i, i, 0.5);
    drawBlueEllipses (random (x), random (y), i, i, 1.5);
    drawBlueEllipses (random (x), random (y), i, i, 0.5);
    drawBlueEllipses (random (x), random (y), i, i, 1.5);
    drawBlueEllipses (random (x), random (y), i, i, 0.5);
    drawBlueEllipses (random (x), random (y), i, i, 1.5);
    drawBlueEllipses (random (x), random (y), i, i, 0.5);
    drawPurpleEllipses (random (x), random (y), i, i, 2.5);
    drawPurpleEllipses (random (x), random (y), i, i, 2.5);
    drawPurpleEllipses (random (x), random (y), i, i, 2.5);
    drawPurpleEllipses (random (x), random (y), i, i, 2.5 );
    drawPurpleEllipses (random (x), random (y), i, i, 2.5);
    drawPurpleEllipses (random (x), random (y), i, i, 2.5 );
    drawPurpleEllipses (random (x), random (y), i, i, 2.5);
    drawPurpleEllipses (random (x), random (y), i, i, 2.5 );
    drawYellowEllipses (random (x), random (y), i, i, 1.5);
    drawYellowEllipses (random (x), random (y), i, i, 0.5);
    drawYellowEllipses (random (x), random (y), i, i, 1.5);
    drawYellowEllipses (random (x), random (y), i, i, 0.5);
    drawYellowEllipses (random (x), random (y), i, i, 1.5);
    drawYellowEllipses (random (x), random (y), i, i, 0.5);
    drawYellowEllipses (random (x), random (y), i, i, 1.5);
    drawYellowEllipses (random (x), random (y), i, i, 0.5);

    //blue, purple and yellow circles to represent the stars' glow
    drawBlueEllipses (x, y/3, i, i, 1.5);
    drawBlueEllipses (x/3, y/9, i, i, 1.8);
    drawBlueEllipses (4*x/7, y, i, i, 1.5);
    drawBlueEllipses (2*x/3, y/2, i, i, 1.8);
    drawBlueEllipses (x/6, y/3, i, i, 1.8);
    drawPurpleEllipses (8*x/9, 7*y/8, i, i, 3.5);
    drawPurpleEllipses (x/2, y/3, i, i, 3.5);
    drawPurpleEllipses (x/7, y/2, i, i, 3.5);
    drawPurpleEllipses (2*x/5, 3*y/4, i, i, 4.0);
    drawPurpleEllipses (0, 4*y/6, i, i, 4.0);
    drawPurpleEllipses (4*x/6, 0, i, i, 4.0);
    drawYellowEllipses (x/3, y/2, i, i, 1.5);
    drawYellowEllipses (3*x/4, y/7, i, i, 1.5);
    drawYellowEllipses (5*x/7, 6*y/8, i, i, 1.5);
    drawYellowEllipses (0, y/10, i, i, 2.5);
    drawYellowEllipses (x/10, y, i, i, 2.5);
  }
  for (i=0; i<=30; i+=5) {
    int x=width;
    int y=height;

    //White centers for blue stars
    drawCenter (x, y/3, 6, 6);
    drawCenter (x/3, y/9, 6, 6);
    drawCenter (4*x/7, y, 6, 6);
    drawCenter (2*x/3, y/2, 6, 6);
    drawCenter (x/6, y/3, 6, 6);

    //White centers for purple stars
    drawCenter (8*x/9, 7*y/8, 5, 5);
    drawCenter (x/2, y/3, 5, 5);
    drawCenter (x/7, y/2, 5, 5);
    drawCenter (0, 4*y/6, 5, 5);
    drawCenter(2*x/5, 3*y/4, 5, 5);
    drawCenter (4*x/6, 0, 5, 5);

    //White centers for yellow stars 
    drawCenter (x/3, y/2, 5, 5);
    drawCenter (3*x/4, y/7, 5, 5);
    drawCenter (5*x/7, 6*y/8, 5, 5);
    drawCenter (x/10, y, 5, 5);
    drawCenter (0, y/10, 5, 5);
  }
}
//function for blue stars
void drawBlueEllipses (float x, float y, int w, int h, float scal) {
  fill (0, 0, 255, 80-i);
  ellipse (x, y, w*scal, h*scal);
}
//function for purple stars
void drawPurpleEllipses (float x, float y, int w, int h, float scal) {
  fill (200, 0, 200, 50-i);
  ellipse (x, y, w*scal, h*scal);
}
//function for yellow stars
void drawYellowEllipses (float x, float y, int w, int h, float scal) {
  fill (250, 240, 13, 90-i);
  ellipse (x, y, w*scal, h*scal);
}
//function for the centers of the stars
void drawCenter (float x, float y, int w, int h) {
  fill (244);
  ellipse (x, y, w, h);
}
//function for smaller blue stars without center
void drawBlue (float x, float y, int w, int h) {
  fill (20, 48, 255, 40);
  ellipse (x, y, w, h);
}
//function for smaller yellow stars without center
void drawYellow(float x, float y, int w, int h) {
  fill (255, 240, 0, 40);
  ellipse (x, y, w, h);
}
//function for smaller purple stars without center
void drawPurple (float x, float y, int w, int h) {
  fill (255, 0, 196, 30);
  ellipse (x, y, w, h);
}
//function from class example for four point stars scaled
void star ( float cx, float cy, float radius, float scal) {
  int n=4;
  float delta = 2*PI/n;
  float idelta = delta/2;
  float iRadius = radius/2;
  float theta = 0.0;

  beginShape();
  for (float i = 0; i < 5; i++ ) {
    vertex(cx + scal*radius*cos(theta), cy + scal*radius*sin(theta));
    vertex(cx + iRadius*cos(theta+idelta), cy + iRadius*sin(theta+idelta));
    theta += delta;
  }
  endShape(CLOSE);
}

// draws random stars to depict the stars twinkling
void draw () {
  float x=width;
  float y=height;
  frameRate (10);

  drawCenter (random (x), random (y), 1, 1);
  drawCenter (random (x), random (y), 3, 3);
  star (random (x), random (y), 2, 2.0);
  star (random (x), random (y), 2, 3.0);
  drawBlue (random (x), random (y), 5, 5);
  drawYellow (random (x), random (y), 5, 5);
  drawPurple (random (x), random (y), 5, 5);
}
//Press mouse to stop loop
void mousePressed() {
  noLoop();
}
//Release mouse to continue loop
void mouseReleased() {
  loop();
}


