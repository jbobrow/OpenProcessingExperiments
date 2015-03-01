
/*

 Just a quick skecth for Xmas holidays 2014
 code by Alessio Erioli - 24.12.2014
 
 Create your own snowflake!
 
 Instructions:
 
 . press and hold your left mouse button to draw, release and move around freely
 . key map:
 
 . +/-   increase/decrease threshold to draw proximity lines
 . d     cycles drawing mode, from fixed threshold (50) to point-based threshold (yes, points retain current threshold value), to points only
 . i     invert color scheme
 . space clears the canvas
 . s     save a raster frame
 . p     save a pdf file
 . 3-9   choose number of sides
 
 
 Please download the sketch and run it on your computer for better performance
 
 */

import processing.pdf.*;

ArrayList <PVector> pts= new ArrayList <PVector> ();
PVector p, p1;
float thres = 50, x, y, r, ang;
int sides = 3, drawMode = 0;
boolean invert = true, savePdf = false, saveImg = false;
String dwMode = "fixed threshold | "+thres;

void setup() {
  size(800, 800);
  smooth();
  noFill();
}

void draw() {
  if (savePdf) beginRecord(PDF, "pdf/snowflake_###.pdf");
  if (invert) {
    background(color(215, 0, 0));
    stroke(255, 50);
    fill(255);
  } else {
    background(255);
    stroke(120, 0, 0, 50);
    fill(120, 0, 0);
  }

  strokeWeight(0.5);
  pushMatrix();
  translate(width*.5, height*.5);
  if (mousePressed) {
    x = mouseX-width*0.5;
    y = mouseY-height*0.5;
    r = sqrt(pow(x, 2)+pow(y, 2));
    if (r<(width*.5-10)) {
      p = new PVector(x, y, thres+random(0, 10));
      //r = sqrt(pow(x, 2)+pow(y, 2));
      //ang = atan2(y, x);
      ang = 2*PI/sides;
      for (int i=0; i<sides; i++) {
        p1 = vecRot(p, ang*i);
        pts.add(p1);
        p1 = vecRot(p, -ang*i);
      }
    }
  }

  if (pts.size() > 2) {
    switch(drawMode) {
    case 0:
      displayLines(thres);
      dwMode = "fixed threshold | "+thres;
      break;
    case 1:
      displayLines2();
      dwMode = "point-based threshold";
      break;
    case 2:
      displayPts();
      dwMode = "points";
      break;
    }
  }
  
  if (savePdf) {
    endRecord();
    savePdf= false;
  }
  
  if (saveImg) {
    saveFrame("images/SnowFlake_####.png");
    saveImg = false;
  }
  
  popMatrix();
  text("threshold: "+thres, 10, 20);
  text("draw mode: "+dwMode, 10, 40);
  text("sides: "+sides, 10, 60);
}

PVector vecRot(PVector p, float ang) {
  PVector r;
  r = new PVector(x*cos(ang)-y*sin(ang), x*sin(ang)+y*cos(ang), p.z);
  return r;
}

void displayPts() {
  pushMatrix();
  strokeWeight(5);
  for (int i=0; i< pts.size (); i++) {
    PVector p = pts.get(i); // mx[i]
    point(p.x, p.y);
  }
  popMatrix();
}

void displayLines2() {
  float d, tThres;
  PVector p, p1;
  for (int i=0; i< pts.size ()-1; i++) {
    p = pts.get(i); // first point
    for (int j=i+1; j< pts.size (); j++) {
      p1 = pts.get(j); // second point
      d = PVector.dist(p, p1); // calculate distance between points
      tThres = max(p.z, p1.z);
      if (d>3 && d<tThres) { 
        line(p.x, p.y, p1.x, p1.y);
      }
    }
  }
}

void displayLines(float t) {
  PVector p, p1;
  float d;
  for (int i=0; i< pts.size ()-1; i++) {
    p = pts.get(i); // first point
    for (int j=i+1; j< pts.size (); j++) {
      p1 = pts.get(j); // second point
      d = PVector.dist(p, p1); // calculate distance between points

      if (d>3 && d<t) line(p.x, p.y, p1.x, p1.y);
    }
  }
}

void keyPressed( ) {
  if (key=='+') thres += 10;
  if (key=='-') thres -= 10;
  if (thres <5) thres = 5;
  if (key=='d') drawMode = (drawMode+1)%3;
  if (key=='i') invert = !invert;
  if (key==' ') pts.clear();
  if (key=='s') saveImg = true;
  if (key=='p') savePdf = true;
  if (key >'2' && key <='9') sides = int(key-'0');
}

