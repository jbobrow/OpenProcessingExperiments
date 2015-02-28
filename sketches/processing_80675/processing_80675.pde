
/**
 * moving corners of rectangles in a grid
 *   
 * MOUSE
 * position x          : corner position offset x
 * position y          : corner position offset y
 * left click          : random position
 * 
 * KEYS
 * s                   : save png
 * p                   : save pdf
 */


import processing.pdf.*;
boolean savePDF = false;

 
int tileCount = 8;
int rectSize = 40;

int actRandomSeed = 10;


void setup(){
  size(600, 600);
}



void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  colorMode(HSB, 360, 100, 100, 100);
  background(360);
  smooth();
  noStroke();

  fill(random (255),random (100), random (100),100);

  randomSeed(actRandomSeed);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
      
      int posX = width/tileCount * gridX;
      int posY = height/tileCount * gridY;

      float shiftX1 = mouseX/10 * random(-3, 1);
      float shiftY1 = mouseY/20 * random(-1, 1);
      float shiftX2 = mouseX/10 * random(-1, 1);
      float shiftY2 = mouseY/20 * random(-1, 3);
      float shiftX3 = mouseX/10 * random(-2, 1);
      float shiftY3 = mouseY/20 * random(-1, 5);
      float shiftX4 = mouseX/10 * random(-1, 1);
      float shiftY4 = mouseY/20 * random(-1, 1);
     
      beginShape();
      vertex(posX+shiftX1, posY+shiftY1);
      vertex(posX+rectSize+shiftX2, posY+shiftY2);
      vertex(posX+rectSize+shiftX3, posY+rectSize+shiftY3);
      vertex(posX+shiftX4, posY+rectSize+shiftY4);
      endShape(CLOSE);
    }
  } 
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}


void mousePressed() {
  actRandomSeed = (int) random(100);
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
