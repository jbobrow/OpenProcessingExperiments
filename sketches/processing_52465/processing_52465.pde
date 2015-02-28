
/*****************************************
 * Assignment 03
 * Name:         Mirella Deocadiz
 * E-mail:       ldeocadiz@brynmawr.edu
 * Course:       CS 110 - Section 02
 * Submitted:    02.14.12
 * 
 *This assignment uses a gradient background and multi-coloured
 *circles. The code for the background is based on the original
 *by Ira Greenberg.
 ***********************************************/

void setup () {
  size (500, 500);
  drawBackground ();
}

// gradient background (from mint green to dark seagreen)
void drawBackground () {
  smooth ();
  noStroke ();
  int steps = 50;
  float x = 0.0;
  float y = 0.0;
  float w = width/steps;
  float h = height;

  color startC, endC;
  startC = color(189, 252, 201);
  endC = color (46, 139, 87);

  float startR, startG, startB;
  float endR, endG, endB;
  float deltaR, deltaG, deltaB;

  startR = red(startC);
  startG = green(startC);
  startB = blue(startC);

  endR = red(endC);
  endG = green(endC);
  endB = blue(endC);

  deltaR  = (endR - startR)/(steps-1);
  deltaG  = (endG - startG)/(steps-1);
  deltaB  = (endB - startB)/(steps-1);

  int i = 0;
  while (i<steps) {
    fill (startC);
    rect (x, y, w, h);
    startR += deltaR;
    startG += deltaG;
    startB += deltaB;
    startC = color (startR, startG, startB);
    x += w;
    i ++;
  }
}

// random colourful circle function
void drawColourfulCircles () {
  int totalShapes = 2;
  int i=1;
  float a, b, c, d;
  stroke(0,50);
  for (i=0; i<totalShapes; i+=1) {
    fill(random(255), random(255), random(255), random(80));
    a = random(width);
    b = random(height);
    c = random(5, 100);
    d = random(5, 100);
    ellipse(a, b, c, d);
  }
}

// drawing the random colourful circles with a function
void draw () {
  drawColourfulCircles ();
  frameRate (40);
}

// if your screen gets too cluttered, then click the mouse so that
// the background gets redrawn and you can start your circles again!
void mousePressed () {
  drawBackground ();
}




