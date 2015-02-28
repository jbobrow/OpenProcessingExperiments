
/**
 * generating a drawing with 3 brushes by analysing livevideo
 * 
 * KEYS
 * q                   : stop drawing
 * w                   : continue drawing
 * s                   : save png
 * r                   : start record pdf
 * e                   : end record pdf
 *
 */

import processing.pdf.*;
import processing.video.*;
boolean savePDF = false;

Capture video;

int pixelIndex;
color c;

float x1, x2, x3, y1, y2, y3;
float curvePointX = 0; 
float curvePointY = 0;

int counter;
int maxCounter = 100000;

void setup() {
  size(800, 800);
  video = new Capture(this, width, height, 15);
  background(255);
  x1 = 0;
  y1 = height/3;
  x2 = width/3;
  y2 = 0;
  x3 = width;
  y3 = height/6;
}

void draw() {
  colorMode(RGB, 0, 0, 0);
  smooth();
  noFill();


  // first line
  pixelIndex = (int) ((width-1-int(x1)) + int(y1)*video.width);
  c = video.pixels[pixelIndex];
  float hueValue = hue(c);
  strokeWeight(hueValue/50);
  stroke(RGB, 255,255,255);

  beginShape();
  curveVertex(x1, y1);
  curveVertex(x1, y1);
  for (int i = 0; i < 7; i++) {
    curvePointX = constrain(x1+random(-50, 50), 0, width-1);
    curvePointY = constrain(y1+random(-50, 50), 0, height-1);
    curveVertex(curvePointX, curvePointY);
  }
  curveVertex(curvePointX, curvePointY);
  endShape();
  x1 = curvePointX;
  y1 = curvePointY;


  // second line
  pixelIndex = (int) ((width-1-int(x2)) + int(y2)*video.width);
  c = video.pixels[pixelIndex];
  float saturationValue = saturation(c);
  strokeWeight(saturationValue/3);
  stroke(c);

  beginShape();
  curveVertex(x2, y2);
  curveVertex(x2, y2);
  for (int i = 0; i < 7; i++) {
    curvePointX = constrain(x2+random(-50, 50), 0, width-1);
    curvePointY = constrain(y2+random(-50, 50), 0, height-1);
    curveVertex(curvePointX, curvePointY);
  }
  curveVertex(curvePointX, curvePointY);
  endShape();
  x2 = curvePointX;
  y2 = curvePointY;


  // third line
  pixelIndex = (int) ((width-1-int(x3)) + int(y3)*video.width);
  c = video.pixels[pixelIndex];
  float brightnessValue = brightness(c);
  strokeWeight(brightnessValue/100);
  stroke(c);

  beginShape();
  curveVertex(x3, y3);
  curveVertex(x3, y3);
  for (int i = 0; i < 7; i++) {
    curvePointX = constrain(x1+random(-100, 50), 0, width-1);
    curvePointY = constrain(y1+random(-100, 50), 0, height-1);
    curveVertex(curvePointX, curvePointY);
  }
  curveVertex(curvePointX, curvePointY);
  endShape();
  x3 = curvePointX;
  y3 = curvePointY;


  counter++;
  if (counter>=maxCounter) noLoop();
}

void mouseClicked(){
   stroke (RGB, random (255),random (255),random (255)); 
}

void keyPressed(){
  switch(key){
  case BACKSPACE:
    background(RGB, 0,255,0);
    break;
  }
}

void keyReleased(){
  if (key == 's'){  
    saveFrame(timestamp()+"_##.png");
  }
  if (key == 'r'){  
    background(360);
    beginRecord(PDF, timestamp()+".pdf");
  }
  if (key == 'e'){  
    endRecord();
  }
  if (key == 'q'){  
    noLoop();
  }
  if (key == 'w'){  
    loop();
  }
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
