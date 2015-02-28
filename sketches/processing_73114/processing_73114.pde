
/*****************************************
 * Assignment 03
 * Name:         Jordan Schwartz
 * E-mail:       jrschwartz@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    10/3/12
 * 
 * This code creates two objects, a canvas and shapes to fill. A 
 trail of randomly colored circles and squares follows the cursor,
 filling in the shapes to preference. Clicking resets the image.
 ***********************************************/

//establish variables
float x = 250;
float y = 250;
float w = 250+mouseX;
float h = 250+mouseY;

//set up sketch
void setup () {
  size (500, 500);
  smooth ();
  //establish objects
  drawEasel ();
}

void drawEasel () {
  float r;
  r= mouseX/2;
  float g;
  g= mouseY/2;
  float b;
  b= (mouseX+mouseY)/2;
  background (random(0, 255), random(0, 255), random(0, 255));
  //draw easel
  stroke(r, g, b);
  strokeWeight(10);
  line(150, 475, 250, 250);
  line(250, 250, 350, 475);
  line(250, 450, 250, 250);
  line(150, 380, 350, 380);
}

void draw () {
   drawShape (x,y,w,h);
  //restrain drawing to canvas
  float d= dist(250, 250, mouseX, mouseY);
  float r= random(30, d);
  if (d+r < 140) { 
    //draw random colored ellipses
    noStroke ();
    ellipseMode (CENTER);
    fill (random(100, 255), random(100, 255), random(0, 255));
    ellipse (mouseX, mouseY, 20, 20);
  }
  if (d+r < 100) {
    noStroke ();
    rectMode (CENTER);
    fill (random(100, 255), random(100, 255), random(0, 255));
    rect (mouseX, mouseY, 20, 20);
  }
}

void drawCanvas (float x, float y, float w, float h) {
  fill (255);
  rectMode(CENTER);
  stroke (0);
  strokeWeight (2);
  rect(x, y, w, h);
}

void drawShape (float x, float y, float w, float h) {
  if (mouseY<250) {
    ellipseMode (CENTER);
    strokeWeight (3);
    noFill ();
    ellipse(x, y, w-20, h-20);
  }
  if (mouseY>250) {
    rectMode (CENTER);
    strokeWeight (3);
    noFill ();
    rect(x, y, w-20, h-20);
  }
}

void mousePressed () {
  drawEasel (); //redraws background and easel
  drawCanvas (x, y, w, h); //redraws canvas
}
