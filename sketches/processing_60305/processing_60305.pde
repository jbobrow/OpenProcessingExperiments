
/*********************************
 Assignment 02
 Name: Hannah Organick
 Email: horganick@brynmawr.edu
 Course:  CS 110 - Section 02
 Submitted: 2/6/12
 
 This program draws stars in the area above the horizon 
 line and cacti in the area below the horizon line depending
 on the mouse position when the mouse is pressed.  These
 objects change in size according to their positions relative
 to the horizon line (objects closer to the horizon line 
 appear smaller, and vice versa). 
 The stars and cacti also scale properly regardless of the 
 sketch size.
 
 **********************************/

/*The sky is drawn using a color gradient iteration 
 (moving from purple to orange) to mimic a sunset.  The ground 
 is then drawn on top of that (also in gradient, moving from 
 rust brown to dark brown), overlapping the sky so that the more 
 orange part of the sky gradient is covered. The horizon line 
 is then drawn 55/100 of the way down the canvas.  Using a 
 fraction and variable allows for this horizon line to be 
 drawn at the same place on the canvas no matter its size. */

void setup() {
  size(800, 480);
  background(255);
  smooth();

  //Sky
  noStroke();
  int steps = height*75/100;
  float x = 0.0;
  float y = 0.0;
  float w = width;
  float h = height/steps;

  color startC, endC;
  startC = color(116, 47, 220); //Starting Color = Purple
  endC = color(220, 168, 47); //Ending Color = Orange

  float startR, startG, startB;
  float endR, endG, endB;
  float deltaR, deltaG, deltaB;

  startR = red(startC);
  startG = green(startC);
  startB = blue(startC);
  endR = red(endC);
  endG = green(endC);
  endB = blue(endC);

  deltaR = (endR-startR)/(steps-1);
  deltaG = (endG-startG)/(steps-1);
  deltaB = (endB-startB)/(steps-1);

  int i=0;
  while (i<steps) {
    fill(startC);
    rect(x, y, w, h);
    startR += deltaR;
    startG += deltaG;
    startB += deltaB;
    startC = color(startR, startG, startB);
    y += h;
    i++;
  }

  //Ground
  int steps2 =height*45/100;
  float x2 = 0.0;
  float y2 = height*55/100;
  float w2 = width;
  float h2 = (height-(height*55/100))/steps2;

  color startC2, endC2;
  startC2 = color(90, 40, 30); //Starting Color = Rust Brown
  endC2 = color(40, 20, 10); //Ending Color = Dark Brown


  float startR2, startG2, startB2;
  float endR2, endG2, endB2;
  float deltaR2, deltaG2, deltaB2;

  startR2 = red(startC2);
  startG2 = green(startC2);
  startB2 = blue(startC2);
  endR2 = red(endC2);
  endG2 = green(endC2);
  endB2 = blue(endC2);

  deltaR2 = (endR2-startR2)/(steps2-1);
  deltaG2 = (endG2-startG2)/(steps2-1);
  deltaB2 = (endB2-startB2)/(steps2-1);

  int j=0;
  while (j<steps2) {
    fill(startC2);
    rect(x2, y2, w2, h2);
    startR2 += deltaR2;
    startG2 += deltaG2;
    startB2 += deltaB2;
    startC2 = color(startR2, startG2, startB2);
    y2 += h2;
    j++;
  }

  //Horizon Line
  stroke(0);
  strokeWeight(1);
  line(0, height*55/100, width, height*55/100);
}


void draw() {/*Remains Empty*/
}


/*This code block draws stars if the mouse is pressed 
 above the horizon line and draws cacti if the mouse is 
 pressed below the horizion line. */
void mousePressed() {
  if (height*55/100 > mouseY) {
    drawStar();
  }
  if (height*55/100 < mouseY) {
    drawCactus();
  }
}

/*The diameter of the star is proportional to the Y 
 position of the mouse. When the mouse is farther from 
 the horizon line (closer to the top of the drawing), 
 the difference between the horizon position and the 
 Y mouse position will be larger, so the diameter will 
 be larger, and vice versa.  The diameter is then scaled 
 to match the screen size by multiplying it by a factor of 
 .035. */

void drawStar() {

  float diamStar;
  diamStar = ((height*55/100)-mouseY)*.035;

  noStroke();
  fill(135, 235, 245, 185);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, diamStar, diamStar);
  fill(random(245, 255), random(245, 255), random(245, 255));
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, (diamStar*4/5), (diamStar*4/5));
}

/* The size of a cactus is determined by the diameters of its 
 many layered circles.  These diameters are proportional to 
 the Y position of the mouse. When the mouse is farther from
 the horizon line (closer to the bottom of the drawing), the
 difference between the horizon position and the Y mouse 
 position will be larger, so the diameter will be larger, and 
 vice versa. The diameter of the cactus circles is then
 scaled to match the screen size by multiplying it by a factor 
 of .2. */

void drawCactus () {
  float diamCactus;
  diamCactus = (mouseY-(height*55/100))*.2;
  fill(25, 45, 20);

  /*Trunk - draws a circle at (mouseX, mouseY), then draws 
   another circle of the same diameter above this position 
   200 times. */
  for (int i=0; i<200; i+=1) {
    noStroke();
    ellipse(mouseX, mouseY-i*diamCactus/22, diamCactus, diamCactus);
  }

  /*Base - draws a square centered at (mouseX, mouseY) that 
   has the same side length as the cactus diameter. This 
   gives the trunk a flat bottom. */
  strokeCap(ROUND);
  strokeJoin(ROUND);
  rectMode(CENTER);
  rect(mouseX, mouseY, diamCactus, diamCactus);

  /*Horizontal Branch - draws "trunks" in the horizontal 
   direction instead of vertical, about two thirds of the
   way up the cactus. The diameter of the circles in these 
   branches is smaller (4/5) the size of the main trunk 
   diameter. */
  float hBranchLength;
  hBranchLength = diamCactus*1.25;

  for (int j=0; j<hBranchLength; j+=1) {
    ellipse(mouseX-j, mouseY-diamCactus*6, diamCactus*.8, diamCactus*.8);
    ellipse(mouseX+j, mouseY-diamCactus*6, diamCactus*.8, diamCactus*.8);
  }

  /*Vertical Branches - draws "trunks" from where the 
   horizontal branches end, up about one fifth of the 
   cactus height. The diameter of the circles in these
   branches is smaller (4/5) the size of the main trunk 
   diameter. */
  float vBranchLength;
  vBranchLength = diamCactus*1.8;    

  for (int k=0; k<vBranchLength; k+=1) {
    ellipse(mouseX-diamCactus*1.25, (mouseY-diamCactus*6)-k, diamCactus*.8, diamCactus*.8);
    ellipse(mouseX+diamCactus*1.25, (mouseY-diamCactus*6)-k, diamCactus*.8, diamCactus*.8);
  }
}


