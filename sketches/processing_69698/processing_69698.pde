
// Oliver Haimson  alhaimso
// Homework 5
// Copyright 2012

// INSTRUCTIONS:
// Move the mouse to move the initials around the screen.
// The initials will initally be getting bigger. 
// Press the spacebar to make them get smaller.
// Press the spacebar again to make them get bigger.
// Press any other key to start over with small initials.

float sw,t;
boolean bigger;

void setup()
{
  size(400,400);
  smooth();
  background(39,59,111);
  t = 5;
  bigger = true;
}

void draw()
{
  background(39,59,111);
  if (bigger==true)
  {
    initials(mouseX,mouseY,t*.5,t*.5,t*.02);
    t+=1;
  }
  if (bigger==false)
  {
    initials(mouseX,mouseY,t*.5,t*.5,t*.02);
       // so that the dimensions of the ellipse are never negative, if the 
       // ellipse gets too small it starts getting bigger again
       if (t>2) {t-=1;}
       else {bigger = !bigger;}
  }
}

void keyPressed()
{
  // use the spacebar to make the initials get bigger or smaller
  if (key == ' ') {bigger = !bigger;}
  // use any other key to start over with small initials
  else {t=5;}
}

void initials(float ix, float iy, float iwd, float iht, float isw)
{
  fill(28,114,183);
  noStroke();
  ellipse(ix,iy,iwd,iht);

  noFill();
  stroke(193,159,35);
  strokeWeight(isw);
  ellipse(ix,iy,iwd,iht);

  stroke(165,31,27);

  // O

  beginShape();
  curveVertex(ix-.15*iwd, iy-.44*iht);
  curveVertex(ix-.26*iwd, iy-.36*iht);
  curveVertex(ix-.4*iwd, iy-.19*iht);
  curveVertex(ix-.44*iwd, iy);
  curveVertex(ix-.39*iwd, iy+.21*iht);
  curveVertex(ix-.22*iwd, iy+.38*iht);
  curveVertex(ix-.15*iwd, iy+.25*iht);
  curveVertex(ix-.12*iwd, iy);
  curveVertex(ix-.15*iwd, iy-.25*iht);
  curveVertex(ix-.24*iwd, iy-.36*iht);
  curveVertex(ix-.31*iwd, iy-.26*iht);
  curveVertex(ix-.23*iwd, iy-.23*iht);
  curveVertex(ix-.17*iwd, iy-.27*iht);
  curveVertex(ix-.085*iwd, iy-.435*iht);
  curveVertex(ix-.05*iwd, iy-.5*iht);
  endShape();

  // L
  
  beginShape();
  curveVertex(ix-.13*iwd, iy+.5*iht);
  curveVertex(ix-.1*iwd, iy+.435*iht);
  curveVertex(ix+.05*iwd, iy-.15*iht);
  curveVertex(ix-.02*iwd, iy-.445*iht);
  curveVertex(ix-.07*iwd, iy-.15*iht);
  curveVertex(ix+.02*iwd, iy+.44*iht);
  curveVertex(ix+.08*iwd, iy+.5*iht);
  endShape();
  
  // H
  
  beginShape();
  curveVertex(ix, iy+.6*iht);
  curveVertex(ix+.1*iwd, iy+.44*iht);
  curveVertex(ix+.19*iwd, iy);
  curveVertex(ix+.13*iwd, iy-.43*iht);
  curveVertex(ix+.11*iwd, iy-.05*iht);
  curveVertex(ix+.16*iwd, iy+.4*iht);
  curveVertex(ix+.26*iwd, iy);
  curveVertex(ix+.35*iwd, iy+.27*iht);
  curveVertex(ix+.44*iwd, iy+.1*iht);
  curveVertex(ix+.43*iwd, iy-.1*iht);
  curveVertex(ix+.27*iwd, iy-.2*iht);
  endShape();
  
}

