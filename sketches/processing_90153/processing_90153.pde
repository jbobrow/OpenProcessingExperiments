
int highlighted = -1;
int locked = -1;
float highlightArea = 30;

// numbers labels
float numAngle= random(TWO_PI);
float numSpacing = 15;
float numSpacingHL = 30;
float numSpacingLk = 25;

float distCatRom, lenCatRom;
float incLen, desirLen; 

PVector mouse, closestCatRom;

PVector[] points = new PVector[4];
RIPKeyframe[] Keyframes = new RIPKeyframe[0];




void setup() {
  size(600, 400);
  background(0);
  noSmooth();

  for (int i=0; i<points.length; i++) {
    points[i] = new PVector(random(20, width-20), random(20, height-20));
  }

  desirLen = 14;

  closestCatRom = new PVector(width*2, height*2);
  distCatRom = sqrt(width*width + height*height); 

  lenCatRom = 0;
  incLen = 0;
}


void draw() {
  background(0);

  DrawPoints(color(255, 100), color(200, 90), 10, points);
  DrawNumbers(color(255, 140), numSpacing, points);
  DrawLines(color(255, 50), points);

  DrawSPLine(1000, color(0, 200, 0), points, true);



  closestCatRom = new PVector(width*2, height*2);
  distCatRom = sqrt(width*width + height*height); 


  lenCatRom = 0;
  incLen = 0;

  highlighted = Check();
  if ((highlighted>=0) && (locked<0))  Highlight(highlighted, false);


  if (locked>=0) {
    points[locked] = new PVector(mouseX, mouseY);
    Highlight(locked, true);
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////

void DrawNumbers(color clr, float spacing, PVector[] points) {

  pushStyle();
  fill(clr);

  for (int i=0; i<(points.length); i++) {
    if ((i == highlighted) && (locked<0)) {
      //  print(locked +" ");
      spacing = numSpacingHL;
    }

    if  (i == locked) {
      spacing = numSpacingLk;
    }

    if ((i!=highlighted) && (i!=locked)) {
      spacing = numSpacing;
    }

    PVector pos = new PVector(cos(numAngle)*spacing, sin(numAngle)*spacing);
    textAlign(CENTER, CENTER);

    text(i, points[i].x+pos.x, points[i].y+pos.y);
  }

  numAngle += 0.03;
  popStyle();
}

/////////////////////////////////////

void DrawPoints(color strColor, color fillColor, float rad, PVector[] points) {
  pushStyle();
  stroke(strColor);
  fill(fillColor);
  for (int i=0; i<(points.length); i++) {
    ellipse(points[i].x, points[i].y, rad, rad);
  }
  popStyle();
}

/////////////////////////////////////

void DrawLines(color clr, PVector[] points) {
  pushStyle();
  stroke(clr);
  for (int i=0; i<(points.length); i++) {
    if (i<points.length-1) {
      line(points[i].x, points[i].y, points[i+1].x, points[i+1].y);
    }
  }
  popStyle();
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////// CATMULL-ROM CURVE /////////////////////////////////////////////////////////////////////////

PVector CatmullRom (float t, PVector P0, PVector P1, PVector P2, PVector P3) { // cubic
  float t2 = t*t;   // squared
  float t3 = t2*t;  // cubed

  float x = 0.5 * ((2*P1.x) + (P2.x - P0.x)*t + (2*P0.x - 5*P1.x + 4*P2.x - P3.x)*t2 + (-P0.x + 3*P1.x - 3*P2.x + P3.x) * t3);
  float y = 0.5 * ((2*P1.y) + (P2.y - P0.y)*t + (2*P0.y - 5*P1.y + 4*P2.y - P3.y)*t2 + (-P0.y + 3*P1.y - 3*P2.y + P3.y) * t3);

  return new PVector (x, y);
}

/////////////////////////////////////

void DrawCatmullRom (int segments, color clr, PVector P0, PVector P1, PVector P2, PVector P3) {
  PVector currPos, prevPos;
  float thisDistCatRom;

  pushStyle();

  for (float i=0; i<segments; i++) {
    currPos = CatmullRom(i/segments, P0, P1, P2, P3);
    prevPos = CatmullRom((i-1)/segments, P0, P1, P2, P3);
    lenCatRom += PVector.dist(currPos, prevPos);
    incLen += PVector.dist(currPos, prevPos);

    mouse   = new PVector(mouseX, mouseY);
    thisDistCatRom = PVector.dist(currPos, mouse);

    if (thisDistCatRom < distCatRom) {
      distCatRom = thisDistCatRom;
      closestCatRom =  currPos;
    }


    stroke(clr);
    strokeWeight(1);
    line(prevPos.x, prevPos.y, currPos.x, currPos.y);

    if (incLen>desirLen) {  

      float t=i/segments; 

      float dx = 0.5 * (P2.x - P0.x + 2*t*(2*P0.x - 5*P1.x + 4*P2.x - P3.x) + 3*t*t*(3*P1.x + P3.x - P0.x - 3*P2.x));
      float dy = 0.5 * (P2.y - P0.y + 2*t*(2*P0.y - 5*P1.y + 4*P2.y - P3.y) + 3*t*t*(3*P1.y + P3.y - P0.y - 3*P2.y));


      pushMatrix();
      rectMode(CENTER);
      translate(currPos.x, currPos.y);
      rotate(atan2( dy, dx ));

      RIPKeyframe[] extended = new RIPKeyframe[Keyframes.length+1];
      extended[extended.length-1] = new RIPKeyframe(currPos.x, currPos.y, atan2( dy, dx ));
      System.arraycopy(Keyframes, 0, extended, 0, Keyframes.length);
      Keyframes = extended;
      extended = null;


      rect(0, 0, 10, 5);
      popMatrix();

      //print(incLen+"   ");
      incLen = 0;
    }
  }
  popStyle();
} 

/////////////////////////////////////

void DrawSPLine (int segments, color clr, PVector[] splineCR, boolean looped) {
  for (int i=0; i<(splineCR.length-3); i++) {
    DrawCatmullRom(segments, clr, splineCR[i], splineCR[i+1], splineCR[i+2], splineCR[i+3]);
  }

  if (looped) {
    DrawCatmullRom(segments, clr, splineCR[splineCR.length-1], splineCR[0], splineCR[1], splineCR[2]);
    DrawCatmullRom(segments, clr, splineCR[splineCR.length-3], splineCR[splineCR.length-2], splineCR[splineCR.length-1], splineCR[0]);
    DrawCatmullRom(segments, clr, splineCR[splineCR.length-2], splineCR[splineCR.length-1], splineCR[0], splineCR[1]);
  }

  pushStyle();
  stroke(clr, 100);
  strokeWeight(3);
  line(mouse.x, mouse.y, closestCatRom.x, closestCatRom.y);
  popStyle();
}


///////////////// CATMULL-ROM CURVE /////////////////////////////////////////////////////////////////////////

///////////////// CHECKS /////////////

int Check() {

  float actDist;
  float nearest = highlightArea + 1;
  int nearestIndex = -1;

  if (locked<0) {
    for (int i=0; i<points.length; i++) {
      PVector mouse = new PVector(mouseX, mouseY);
      actDist= PVector.dist(mouse, points[i]);
      if ((actDist<highlightArea) && (actDist<nearest)) {
        nearestIndex = i;
        nearest = actDist;
      }
    }
  }
  return nearestIndex;
}

///////////////// CHECKS /////////////

///////////////// HIGHLIGHT /////////////
void Highlight(int index, boolean lock) {
  pushStyle();
  colorMode(HSB, 360, 100, 100);
  color stroHL = color (203, 91, 99, 250);
  color fillHL = color (203, 91, 99, 90);
  float radHL  = 35;

  color stroLk = color (359, 91, 99, 250);
  color fillLk = color (359, 91, 99, 90);
  float radLk  = 25;



  color strokeColor;
  color fillColor;
  float radius;

  if (lock) {
    strokeColor = (stroLk);
    fillColor = (fillLk);
    radius = radLk;
  }
  else {
    strokeColor = (stroHL);
    fillColor = (fillHL);
    radius = radHL;
  }

  stroke(strokeColor);
  fill(fillColor);
  ellipse(points[index].x, points[index].y, radius, radius);
  popStyle();
}

///////////////// HIGHLIGHT /////////////


////////////////  INPUT  ////////////////////////////////////////////
void mousePressed() {

  if ((highlighted<0) && (locked<0)) { 
    PVector[] extended = new PVector[points.length+1];
    extended[extended.length-1] = new PVector(mouseX, mouseY);
    System.arraycopy(points, 0, extended, 0, points.length);
    points = extended;
    extended = null;
  }

  if ((highlighted>=0) && (locked<0)) {
    locked = highlighted;
  }
}


void mouseReleased() {
  if ((locked>=0) && (mouseX>0) && (mouseX<width) && (mouseY>0 && (mouseY<height)) ) {
    locked = -1;
  }
}

/*
void keyPressed() {
 for (int i=1; i<points.length; i++) {
 points[i] = points[0];
 }
 }
 */
////////////////  INPUT  ////////////////////////////////////////////


// point with rotation >> Regular Interpolation Keyframes
class RIPKeyframe extends PVector {
  float rot;

  RIPKeyframe(float x, float y, float z, float rot) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.rot = rot;
  }

  RIPKeyframe(float x, float y, float rot) {
    this.x = x;
    this.y = y;
    this.rot = rot;
  }

  RIPKeyframe(PVector pos, float rot) {
    this.x = pos.x;
    this.y = pos.y;
    this.z = pos.z;
    this.rot = rot;
  }
}
