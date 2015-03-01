
/*
File Name: Squares
 Author: Dylan Martin
 This file modifies an existing draw tool by Justin Lincoln, and 
 adds some extra features.
 */


void setup() {
  size(700, 500);
  background(255);
  smooth();
  frameRate(30);
}

void draw() {
  float l = random(6, 30);
  float w = random(6, 30);
  float rad = random(6, 30);
  if (mousePressed) {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(mouseX, mouseY, l, w);
    fill(random(0,255), random(50), random(50)); //Allows for more colors of rectangles
    rect(pmouseX, pmouseY, l, w);
    stroke(0);
    strokeWeight(random(.5, 5.5));
    strokeCap(ROUND);
    stroke(random(0,255),0,0);
    line(mouseX,mouseY,pmouseX,pmouseY);
    noStroke();
  }
}


void keyPressed() {

  if (key=='s') {
    saveImage();
  }
  if (key=='z') {
    background(255);
  }
  /* 
   Below are some new filters I added.  The 'b' key now makes the image 
   black/white, and the 'i' key inverts the colors.
   */
  if (key=='b') {
    filter(GRAY);
  }
  if (key=='i') {
    filter(INVERT);
  }
}

void saveImage() {
  String fileName = timeStamp()+".tiff";
  PImage imageSave = get(0, 0, width, height);
  imageSave.save(fileName);
}

String timeStamp() {
  String timestamp = year()+"_"+month()+"_"+day()+"_"+minute()+"_"+second()+"_"+millis();
  return timestamp;
}
