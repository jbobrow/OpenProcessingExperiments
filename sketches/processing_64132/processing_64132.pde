
/* litmus4_cover
   Version: 1.0, 2012-06-15
   
   Code to generate the cover image for Litmus Paper issue 4, 16 June 2012
   
   Written by Phillip Kent for Litmus Paper at the Cheltenham Science Festival
   
   http://design-science.org.uk/litmus-paper/
   http://www.openprocessing.org/collection/1676

   Acknowledgements:
   This code is based on "hextiles" by Maciek Makowski
   http://www.openprocessing.org/sketch/6785 
   
   USE THESSE KEYS TO CONTROL THE SKETCH:
   F = tile flips on/off
   H = show hexagons on/off
   O = restart with ordered tiles
   R = restart with random tiles
*/

//Uncomment next line to get PDF output
//import processing.pdf.*;

int tileSize =  90;
boolean firstFrame;
boolean startRandom;
boolean randomFlip;
boolean showHexagon;
float centreX, centreY, r, theta;
//float transformFactor,transformFactorMin, transformFactorMax; //not in use in this version

void setup() {
  //Use next line to make PDF output and comment out the other size(...)
  //size(800,800, PDF, "cover4test.pdf");
  size(800,800);
  background(255, 255, 255);
  stroke(0);
  smooth();
  noFill();
  frameRate(5);
  firstFrame = true;
  startRandom = true;
  randomFlip = false;
  showHexagon = true;
  centreX = width/2;
  centreY = height/2;
  /* not in use in this version
  transformFactor = 75;  
  transformFactorMin = 10; 
  transformFactorMax = 150;
  */
}

void drawInitial() {
  float dx = tileSize * cos(radians(30)) * 2;
  int startval = int(random(5));
  int l = 0;
  for (float y = 0.0; y < height + tileSize; y += tileSize/2) {
    for (float x = l % 2 * dx / 2; x < width + tileSize; x += dx) {     
      if (startRandom) {
        strokeWeight(1);
        if (showHexagon) { stroke(0); } else { stroke(255);}       
        blankModule(x,y,tileSize);
        stroke(110,124,184);
        strokeWeight(5);
        int randnum = int(random(5)); 
        module(x, y, tileSize, randnum, 0);
      } else {
        strokeWeight(1);
        if (showHexagon) { stroke(0); } else { stroke(255);}
        blankModule(x, y, tileSize);
        stroke(110,124,184);
        strokeWeight(5);
        module(x, y, tileSize, startval,0);
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
  
  //If you want PDF output, uncomment the next line
  //exit(); 
  
 if (randomFlip) {  // only change tiles if randomFlip=true
  float dx = tileSize * cos(radians(30.0)) * 2.0;
  int l = (int) random(2 * height / tileSize);
  float y = l * tileSize / 2.0;
  float x = l % 2 * dx / 2 + (int) random(width / dx) * dx;
  fill(255);
  strokeWeight(1);
  if (showHexagon) { stroke(0); } else { stroke(255);}
  blankModule(x, y, tileSize);
  noFill();
  stroke(110,124,184);
  strokeWeight(5);
  int randnum = int(random(5)); 
  module(x, y, tileSize, randnum, 0); 
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
  /* not in use in this version
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
  */
}

//Functions to define the spatial transformation

//null transform
float transformX(float x, float y) {
  return x;
}
float transformY(float x, float y) {
  return y;
}

/* not in use in this version
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
*/


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
  float nodesize=0.3*size;
  
  //SMALL ARC
  arcCentreX = cx + side*cos(rotation*PI/3);
  arcCentreY = cy + side*sin(rotation*PI/3);
  
  //put 'node' position 1 by random choice
  if (random(1)<0.7) { 
    fill(110,124,184);
    ellipse(transformX(arcCentreX + smallArcRadius*cos(startCurveRotation*PI/3+PI/3), 
                      arcCentreY+smallArcRadius*sin(startCurveRotation*PI/3+PI/3)), 
         transformY(arcCentreX + smallArcRadius*cos(startCurveRotation*PI/3+PI/3), 
            arcCentreY+smallArcRadius*sin(startCurveRotation*PI/3+PI/3)),nodesize,nodesize);
    noFill();        
  }
  
  //put 'node' position 2 by random choice
  if (random(1)<0.7) { 
    //fill(110,124,184);
    ellipse(transformX(arcCentreX + 3*smallArcRadius*cos(startCurveRotation*PI/3+PI/3), 
                      arcCentreY+3*smallArcRadius*sin(startCurveRotation*PI/3+PI/3)), 
         transformY(arcCentreX + 3*smallArcRadius*cos(startCurveRotation*PI/3+PI/3), 
            arcCentreY+3*smallArcRadius*sin(startCurveRotation*PI/3+PI/3)),nodesize,nodesize);
    //noFill();        
  }
  
  beginShape();
    for (float n = 0.0; n <= 2.0; n = n+1.0) {   
      vertex(transformX( arcCentreX + smallArcRadius*cos(startCurveRotation*PI/3+n/2.*2*PI/3), 
                      arcCentreY+smallArcRadius*sin(startCurveRotation*PI/3+n/2.*2*PI/3)), 
         transformY(arcCentreX + smallArcRadius*cos(startCurveRotation*PI/3+n/2.*2*PI/3), 
            arcCentreY+smallArcRadius*sin(startCurveRotation*PI/3+n/2.*2*PI/3) )); 
    }
  endShape();
  
  //BIG ARC 1
  float arcradius = 2.*side*cos(PI/6.);
  float centreangle= 5*PI/6. - float(rotation)*PI/3.;
  float steps;
  steps = 1;
  arcCentreX = cx + arcradius*cos(-centreangle);
  arcCentreY = cy + arcradius*sin(-centreangle);
  startCurveRotation = rotation;
  
  beginShape();
    for (float n = 0.0; n <= steps; n = n+1.0) {    
      vertex(transformX( arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+n/steps*PI/3), 
                      arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+n/steps*PI/3)), 
         transformY(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+n/steps*PI/3), 
            arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+n/steps*PI/3) )); 
    }
  endShape();
  
  
  //BIG ARC 2
  arcradius = 2.*side*cos(PI/6.);
  centreangle= 7.*PI/6. -float(rotation)*PI/3.;
  arcCentreX = cx + arcradius*cos(-centreangle);
  arcCentreY = cy + arcradius*sin(-centreangle);
  startCurveRotation = rotation+5;
  beginShape();
    for (float n = 0.0; n <= steps; n = n+1.0) { 
      vertex(transformX( arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+n/steps*PI/3), 
                      arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+n/steps*PI/3)), 
         transformY(arcCentreX + bigArcRadius*cos(startCurveRotation*PI/3+n/steps*PI/3), 
            arcCentreY+bigArcRadius*sin(startCurveRotation*PI/3+n/steps*PI/3) )); 
    }
  endShape();
  
  
}


