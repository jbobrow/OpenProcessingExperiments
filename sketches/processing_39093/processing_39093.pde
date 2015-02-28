
// Kaleidoscope Framework - Jim Bumgardner
//
// Use 'm' to toggle mirrors
// 2-9 a-l to change mirror angle
//

import processing.opengl.*;

int    nbrSides = 7;

int    scopeRadius = 400;
int    scopeMargin = 8;

float  mirrorRadians = 0;
int    objectCellHeight = 0, 
       objectCellWidth = 0;

PGraphics objectCell;
PGraphics wedgePG;

Boolean usesMirrors = true;

void setup() 
{
  // size(scopeRadius*2+scopeMargin*2, scopeRadius*2+scopeMargin*2, OPENGL);
  size(816, 816, OPENGL);
  smooth();
  SetupMirror();
}

// CHANGE THIS FUNCTION TO GET DIFFERENT KALEIDOSCOPES
void DrawCell(PGraphics oc)
{
  float tm = (millis() % 1000) / 1000.0;

  oc.beginDraw();
  oc.smooth();
  oc.background(0);
  oc.noStroke();

  int  nbrStripes = 40;
  int  stripeThick = 5;
  int  stripeSpacing = 10;
  
  for (int i = 0; i < nbrStripes; ++i)
  {
    oc.fill(sin(i*2+2*tm)*128+128,sin(i*2+2+2*tm)*128+128,sin(i*2+4+2*tm)*128+128);
    oc.rect(0, i*stripeSpacing+tm*stripeSpacing-stripeSpacing, width, stripeThick);
    if (i*stripeSpacing > objectCellHeight)
      break;
  }
  oc.endDraw();
}
		
void SetupMirror()
{
    mirrorRadians = 2*PI / (nbrSides*2);

    objectCellWidth = scopeRadius;
    objectCellHeight = ceil(sin(mirrorRadians)*scopeRadius);
    objectCell = createGraphics(objectCellWidth, objectCellHeight, P2D);
    wedgePG = createGraphics(objectCellWidth, objectCellHeight, P2D);
  
    wedgePG.beginDraw();
      wedgePG.smooth();
      wedgePG.background(0);
      wedgePG.fill(255);
      wedgePG.stroke(255);  
      wedgePG.beginShape();
      wedgePG.vertex(0,0);
      wedgePG.curveVertex(scopeRadius,0);
      wedgePG.curveVertex(scopeRadius,0);
      wedgePG.curveVertex(cos(mirrorRadians*.5)*scopeRadius, sin(mirrorRadians*.5)*scopeRadius);
      wedgePG.curveVertex(cos(mirrorRadians)*scopeRadius, sin(mirrorRadians)*scopeRadius);
      wedgePG.curveVertex(cos(mirrorRadians)*scopeRadius, sin(mirrorRadians)*scopeRadius);
      wedgePG.endShape(CLOSE);
    wedgePG.endDraw();
}

void draw() 
{
  background(0);
  
  DrawCell(objectCell);

  if (usesMirrors)
    objectCell.mask(wedgePG);

  pushMatrix();
    translate(width/2, height/2);
    rotate(millis() * .00005);    // rotating of scope as a whole
    if (usesMirrors)
    {
      for (int i = 0; i < nbrSides; ++i)
      {
        // for each reflection
        pushMatrix();
          rotate(mirrorRadians*i*2);
          image(objectCell, 0, 0);
          scale(1,-1);
          image(objectCell, 0, 0);
        popMatrix();
      }
    }
    else {
        image(objectCell, 0, 0);
    }
  popMatrix();
}

void keyPressed() {
  if (key == 'm') 
  {
    usesMirrors = !usesMirrors;
    println("MIRRORS " + (usesMirrors? "ON" : "OFF"));
  }
  else if (key >= '2' && key <= '9') {
    nbrSides = key - '0';
    SetupMirror();
  }
  else if (key >= 'a' && key <= 'l') {
    nbrSides = 10 + key - 'a';
    SetupMirror();
  }
}



