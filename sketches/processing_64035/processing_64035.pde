
/* litmus2_cover
   Version: 1.1, 2013-03-21
   
   Code to generate the cover image for Litmus Paper issue 2, 14 June 2012
   
   Written by Phillip Kent for Litmus Paper at the Cheltenham Science Festival
   
   http://design-science.org.uk/litmus-paper/
   http://www.openprocessing.org/collection/1676
   
   History:
   V1.0 (2012-06-14): version for the printed edition of Litmus Paper
   V1.1 (2013-03-21): sketch ported to Processing version 2 and JavaScript output; no changes to the code

   Acknowledgements:
   This code is based on "hextiles" by Maciek Makowski
   http://www.openprocessing.org/sketch/6785 
   
   OPTION KEYS:
   F = tile flips on/off
   H = show hexagons on/off
   O = restart with ordered tiles
   R = restart with random tiles
   > = transformation factor increase
   < = transformation factor decrease
*/

int tileSize =  60;
boolean firstFrame;
boolean startRandom;
boolean randomFlip;
boolean showHexagon;
float centreX, centreY, r, theta;
float transformFactor,transformFactorMin, transformFactorMax;

void setup() {
  size(800,800);
  background(255, 255, 255);
  stroke(0);
  smooth();
  noFill();
  frameRate(5);
  firstFrame = true;
  startRandom = true;
  randomFlip = true;
  showHexagon = false;
  transformFactor = 75;
  transformFactorMin = 10; 
  transformFactorMax = 150;
  centreX = width/2;
  centreY = height/2;
}

void drawInitial() {
  float dx = tileSize * cos(radians(30)) * 2;
  int startval = int(random(5));
  int l = 0;
  for (float y = 0.0; y < height + tileSize; y += tileSize/2) {
    for (float x = l % 2 * dx / 2; x < width + tileSize; x += dx) {     
      if (startRandom) {
        if (showHexagon) { stroke(21,212,224); } else { stroke(255);}       
        blankModule(x,y,tileSize);
        stroke(200);
        strokeWeight(max(1, int(5*(transformX(width,0)-width/2)/sqrt(sq(transformX(x,y)-width/2)+sq(transformY(x,y)-width/2)))));
        int randnum = int(random(5));
        //draw the grey 'thread' 
        module(x, y, tileSize, randnum, 0); // rotation in module() needs to range 0 to 5
        stroke(0);
        strokeWeight(1);
        //draw a black 'shadow'
        module(x, y, tileSize, randnum, +1);
        module(x, y, tileSize, randnum, -1);
 
      } else {
        if (showHexagon) { stroke(21,212,224); } else { stroke(255);}
        blankModule(x, y, tileSize);
        stroke(200);
        strokeWeight(max(1, int(5*(transformX(width,0)-width/2)/sqrt(sq(transformX(x,y)-width/2)+sq(transformY(x,y)-width/2)))));
        //draw the grey 'thread' 
        module(x, y, tileSize, startval,0); // rotation in module() needs to range 0 to 5
        stroke(0);
        strokeWeight(1);
        //draw a black 'shadow'
        module(x, y, tileSize, startval, 1);
        module(x, y, tileSize, startval, -1);
      }
    }
    
    l++;
  }
}

void draw() {
  smooth();
  if (firstFrame) {
      background(255);
      drawInitial();
      firstFrame = false;
      return;
  }
  
 if (randomFlip) {  // only change tiles if randomFlip=true
  float dx = tileSize * cos(radians(30.0)) * 2.0;
  int l = (int) random(2 * height / tileSize);
  float y = l * tileSize / 2.0;
  float x = l % 2 * dx / 2 + (int) random(width / dx) * dx;
  fill(255);
  if (showHexagon) { stroke(21,212,224); } else { stroke(255);}
  blankModule(x, y, tileSize);
  noFill();
  stroke(200);
  strokeWeight(max(1, int(5*(transformX(width,0)-width/2)/sqrt(sq(transformX(x,y)-width/2)+sq(transformY(x,y)-width/2)))));
  int randnum = int(random(5));
  //draw the grey 'thread' 
  module(x, y, tileSize, randnum, 0); 
  stroke(0);
  strokeWeight(1);
  //draw a black 'shadow'
  module(x, y, tileSize, randnum, 1);
  module(x, y, tileSize, randnum,-1);
 }
}

void keyPressed() {
  if (key == 'h' || key == 'H') {
      showHexagon = !showHexagon;
  }
  if (key == 'f' || key == 'F') {
      randomFlip = !randomFlip;
  }
  if (key == 'r' || key == 'R') {
      firstFrame=true;
      startRandom=true;
  }
  if (key == 'o' || key == 'O') {
      firstFrame=true;
      startRandom=false;
  }
  if (key == '.' || key == '>') {
      if (transformFactor > transformFactorMin) { 
         transformFactor-- ;
         firstFrame=true;
         startRandom=true;
      }
  }
  if (key == ',' || key == '<') {
      if (transformFactor < transformFactorMax) { 
         transformFactor++ ; 
         firstFrame=true;
         startRandom=true;
     }
  }
}

//Functions to define the spatial transformation

/*
//null transform for testing
float transformX(float x, float y) {
  return x;
}
float transformY(float x, float y) {
  return y;
}
*/

float transformX(float x, float y) {
  float cx = x - width/2;
  float cy = y - height/2;
  float r = sqrt(cx*cx + cy*cy);
  return width/2 + width*atan(r/transformFactor)/PI*cos(PI+atan2(cy,cx));
}

float transformY(float x, float y) {
  float cx = x - width/2;
  float cy = y - height/2;
  float r = sqrt(cx*cx + cy*cy);
  return height/2 + width*atan(r/transformFactor)/PI*sin(PI+atan2(cy,cx));
}



// Erase the current tile with blank space
void blankModule(float cx, float cy, float size) {
  float side = size * tan(radians(30));
  beginShape();
  for (int i = 0; i <= 6; i++) {
    vertex(transformX( cx + side*cos(i*PI/3),cy+side*sin(i*PI/3)), 
           transformY( cx + side*cos(i*PI/3),cy+side*sin(i*PI/3)));
  }
  endShape();
}

void module(float cx, float cy, float size, int rotation, int bShadow) {
  //bShadow = 0 for a 'fill' arc, 1 or -1 for a shadow arc
  int startCurveRotation = rotation + 2; //need to shift the start angle of small arc 
  float arcCentreX,arcCentreY;
  float side = size * tan(radians(30));
  float smallArcRadius = (side / 2) + 0.7*bShadow;
  float bigArcRadius = size * cos(radians(30))  + 0.7*bShadow;
  //SMALL ARC
  arcCentreX = cx + side*cos(rotation*PI/3);
  arcCentreY = cy + side*sin(rotation*PI/3);
  
  beginShape();
    curveVertex(transformX(arcCentreX + smallArcRadius*cos(startCurveRotation*PI/3),arcCentreY+smallArcRadius*sin(startCurveRotation*PI/3)),
       transformY(arcCentreX + smallArcRadius*cos(startCurveRotation*PI/3),arcCentreY+smallArcRadius*sin(startCurveRotation*PI/3)));
    for (float n = 0.0; n <= 10.0; n = n+1.0) {   
      curveVertex(transformX( arcCentreX + smallArcRadius*cos(startCurveRotation*PI/3+n/10.*2*PI/3), 
                      arcCentreY+smallArcRadius*sin(startCurveRotation*PI/3+n/10.*2*PI/3)), 
         transformY(arcCentreX + smallArcRadius*cos(startCurveRotation*PI/3+n/10.*2*PI/3), 
            arcCentreY+smallArcRadius*sin(startCurveRotation*PI/3+n/10.*2*PI/3) )); 
    }
    curveVertex(transformX(arcCentreX + smallArcRadius*cos(startCurveRotation*PI/3+2.*PI/3), 
                    arcCentreY+smallArcRadius*sin(startCurveRotation*PI/3+2.*PI/3)),    
         transformY(arcCentreX + smallArcRadius*cos(startCurveRotation*PI/3+2.*PI/3), 
                arcCentreY+smallArcRadius*sin(startCurveRotation*PI/3+2.*PI/3)));
  endShape();
  
  //BIG ARC 1
  float arcradius = 2.*side*cos(PI/6.);
  float centreangle= 5*PI/6. - float(rotation)*PI/3.;
  float steps;
  float gap;
  arcCentreX = cx + arcradius*cos(-centreangle);
  arcCentreY = cy + arcradius*sin(-centreangle);
  startCurveRotation = rotation;
  beginShape();
    curveVertex(transformX(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3),arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3)),
       transformY(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3),arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3)));
    for (float n = 0.0; n <= 10.0; n = n+1.0) {    
      curveVertex(transformX( arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+n/10.*PI/3), 
                      arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+n/10.*PI/3)), 
         transformY(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+n/10.*PI/3), 
            arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+n/10.*PI/3) )); 
    }
    curveVertex(transformX(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+PI/3), 
                    arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+PI/3)),    
         transformY(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+PI/3), 
                arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+PI/3)));
  endShape();
  
  
  //BIG ARC 2
  steps = 30;
  gap = floor(steps/2) -3;
  arcradius = 2.*side*cos(PI/6.);
  centreangle= 7.*PI/6. -float(rotation)*PI/3.;
  arcCentreX = cx + arcradius*cos(-centreangle);
  arcCentreY = cy + arcradius*sin(-centreangle);
  startCurveRotation = rotation+5;
  // Arc is drawn in two sections with a gap to give crossing effect
  beginShape();
    curveVertex(transformX(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3),arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3)),
       transformY(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3),arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3)));
    for (float n = 0.0; n <= (gap-1); n = n+1.0) { 
      curveVertex(transformX( arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+n/steps*PI/3), 
                      arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+n/steps*PI/3)), 
         transformY(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+n/steps*PI/3), 
            arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+n/steps*PI/3) )); 
    }
    curveVertex(transformX(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+ (gap-1)/steps*PI/3), 
                    arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+ (gap-1)/steps* PI/3)),    
         transformY(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+ (gap-1)/steps* PI/3), 
                arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+ (gap-1)/steps*PI/3)));
  endShape();
  
  beginShape();
    curveVertex(transformX(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3 + (gap+1)/steps*PI/3),arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+(gap+1)/steps*PI/3)),
       transformY(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+(gap+1)/steps*PI/3),arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+(gap+1)/steps*PI/3)));
    for (float n = gap+1; n <= steps; n = n+1.0) { 
      curveVertex(transformX( arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+n/steps*PI/3), 
                      arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+n/steps*PI/3)), 
         transformY(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+n/steps*PI/3), 
            arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+n/steps*PI/3) )); 
    }
    curveVertex(transformX(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+ PI/3), 
                    arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+ PI/3)),    
         transformY(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+ PI/3), 
                arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+ PI/3)));
  endShape(); 
}



