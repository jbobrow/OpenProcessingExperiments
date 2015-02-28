
// MODIFIED BY JAKE OLIVEIRA
//
// Credit to Hartmut Bohnacker
//
/**
 * draws a modulated lissajous curve
 *
 * MOVE MOUSE
 * Move Mouse        : Change Frequency spacing and opacity
 *
 * KEYS
 * 1/3               : Change Telepathic Frequency
 */

PImage bg;
import processing.pdf.*;
boolean savePDF = false;

int pointCount = 500;
int freqX = 1;
int freqY = 4;
float phi = 60;

int modFreqX = 2;
int modFreqY = 1;
float modulationPhi = 0;

float angle;
float x, y; 
float w, maxDist;
float oldX, oldY;

int drawMode = 2;


void setup() {
  size(400, 500);
  smooth();
  strokeCap(ROUND);
  stroke(0,191,255);
  
  bg = loadImage("profx.png");

  maxDist = sqrt(sq(width/3-50) + sq(height/5-50));
}


void draw() {
  // if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  if (savePDF) beginRecord(PDF, freqX+"_"+freqY+"_"+int(phi)+"_"+modFreqX+"_"+modFreqY+".pdf");

  background(bg);

  translate(width/2, height/4.8);

  pointCount = mouseX*2+200;

  if (drawMode == 1) {
    stroke(0,191,255);
    strokeWeight(2);

    beginShape();
    for (int i=0; i<=pointCount; i++){
      angle = map(i, 0,pointCount, 0,TWO_PI);

      x = sin(angle * freqX + radians(phi)) * cos(angle * modFreqX);
      y = sin(angle * freqY) * cos(angle * modFreqY);

      x = x * (width/2-50);
      y = y * (height/2-50);

      vertex(x, y);
    }
    endShape();

  } 
  else if (drawMode == 2) {
    strokeWeight(10);
    stroke(0, 191, 255);

    for (int i=0; i<=pointCount; i++){
      angle = map(i, 0,pointCount, 0,TWO_PI);

      // amplitude modulation
      x = sin(angle * freqX + radians(phi)) * cos(angle * modFreqX);
      y = sin(angle * freqY) * cos(angle * modFreqY);

      x = x * (width/2-50);
      y = y * (height/2-50);

      if (i > 0) {
        w = dist(x, y, 0, 0);
        float lineAlpha = map(w, 0,maxDist, 255,0);
        stroke(0, 191, 255, lineAlpha);
        line(oldX, oldY, x, y);
      }

      oldX = x;
      oldY = y;
    }
  }


  if (savePDF) {
    savePDF = false;
    println("saving to pdf – finishing");
    endRecord();
  }
}



void keyPressed(){

  if(key == '1') freqX--;
  if(key == '2') freqX++;
  freqX = max(freqX, 1);

  if(key == '3') freqY--;
  if(key == '4') freqY++;
  freqY = max(freqY, 1);

  if (keyCode == LEFT) phi -= 15;
  if (keyCode == RIGHT) phi += 15;
  
 
  modFreqY = max(modFreqY, 1);
  
  println("freqX: " + freqX + ", freqY: " + freqY + ", phi: " + phi + ", modFreqX: " + modFreqX + ", modFreqY: " + modFreqY); 
}


String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}























