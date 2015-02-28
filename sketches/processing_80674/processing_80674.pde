
/**
 * changing size and position of circles in a grid
 *   
 * MOUSE
 * position x          : circle position
 * position y          : circle size
 * left click          : random position + color change
 * 
 * KEYS
 * s                   : save png
 * p                   : save pdf
 */

import processing.pdf.*;
boolean savePDF = false;

float tileCount = 30;
color circleColor = color(random(255), random(255), random(255), 100);
int circleAlpha = 180;
int actRandomSeed = 0;
int value = 0;

void setup(){
  size(600, 600);
}

void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  translate(width/tileCount/3, height/tileCount/3);

  background(255);
  smooth();
  noFill();
  
  
  randomSeed(actRandomSeed);

  stroke(circleColor, circleAlpha);
  strokeWeight(mouseY/40);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      float posX = width/tileCount * gridX;
      float posY = height/tileCount * gridY;

      float shiftX = random(-mouseX, mouseX)/20;
      float shiftY = random(-mouseX, mouseX)/20;

      ellipse(posX+shiftX, posY+shiftY, mouseY/15, mouseY/15);
    }
  }
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mousePressed() {
  actRandomSeed = (int) random(100000);
  
  if (circleAlpha< tileCount){
   circleColor -=100 ;
  }
  else {
   circleColor +=100; 
  }
  
}


void keyReleased(){
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
