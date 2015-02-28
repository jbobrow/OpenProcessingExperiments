
// homework #5 
// copyright 2012 leyli guliyeva

// moving the mouse around will move the initials around
// press down the mouse for the initials to change colors
// press the space bar to increase the size of the circle

float x, y, diam;

int col, backCol;

void setup()
{
  size (400, 400);
  smooth ();
  x = 200;
  y = 200;
  diam = 300;
  col = color(255, 238, 187);
  backCol = color(random(150, 220), random(198, 240), random (170,228));
  frameRate = 100;
  fill (random(255,255), random(161,228), random (46,296));
  
}

void draw ()
{
  background (backCol);
  noStroke();
  rect (0, 0, width, height);
  drawInitials (pmouseX, pmouseY, diam/2);
}

void keyPressed()
{
  if (key == ' ')
  { 
    background (random(150, 220), random(198, 240), random (170,228));
    diam = diam*1.5;
    if (diam > 1000) {
      diam = diam/10;
    }
  }
  
}



void drawInitials (float x, float y, float diam)
{
fill (255, 142, 153);
strokeWeight (0);
stroke (255, 90, 104);
ellipse (x, y, diam+10, diam+10);

//center circle
fill (255, 90, 104);
strokeWeight(6);
stroke (232, 68, 82);
ellipse (x, y, diam-27, diam-27);

// vertical L stroke
stroke ( col);
strokeWeight (11);
noFill ();
beginShape();
  vertex (x - .30*diam, y - .20*diam);
  vertex (x - .30*diam, y + .25*diam);
endShape ();

// Curve of L
beginShape();
  curveVertex(x - .5*diam, y + .5*diam);
  curveVertex(x - .30*diam, y + .25*diam);
  curveVertex(x - .04*diam, y + .25*diam);
  curveVertex(x + .5*diam, y + .5*diam);
endShape();

// Curve of G
strokeWeight (11);
stroke (col);
beginShape();
curveVertex ( x + .34*diam, y + .07*diam);
curveVertex ( x + .32*diam, y - .1*diam);
curveVertex ( x + .17*diam, y - .2*diam);
curveVertex ( x + .03*diam, y - .1*diam);
curveVertex ( x + .03*diam, y + .15*diam);
curveVertex ( x + .2*diam, y + .25*diam);
curveVertex ( x + .32*diam, y + .15*diam);
curveVertex ( x + .32*diam, y +.03*diam);
curveVertex ( x + .17*diam, y +.03*diam);
curveVertex ( x, y +.03*diam );
endShape ();

if (mousePressed) {
    col = color(random(150, 255), random (150, 238), random (193, 245));
    }
    else {
    col = color(255, 238, 187);
  }
}

