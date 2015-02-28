
import processing.pdf.*;

int tileCount = 30;
int rectSize = 40;

int actRandomSeed = 0;

void setup(){
  size(800, 800);
  smooth();
  colorMode(HSB,100);
}

void draw() {

  colorMode(HSB, 100);
  background(100);
  stroke(random(30,70),random(60,30),80,50);
  strokeWeight(6);  
  noFill();
  

  randomSeed(actRandomSeed);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
      
      int posX = (width/tileCount * gridX);
      int posY = (height/tileCount * gridY);

      float shiftX1 = mouseX/30 * random(-1, 1);
      float shiftY1 = mouseY/30 * random(-1, 1);
      float shiftX2 = mouseX/30 * random(-1, 1);
      float shiftY2 = mouseY/30 * random(-1, 1);
      float shiftX3 = mouseX/30 * random(-1, 1);
      float shiftY3 = mouseY/30 * random(-1, 1);
      float shiftX4 = mouseX/30 * random(-1, 1);
      float shiftY4 = mouseY/30 * random(-1, 1);
     
      beginShape();
      vertex(posX+shiftX1, posY+shiftY1);
      vertex(posX+rectSize+shiftX2, posY+shiftY2);
      vertex(posX+rectSize+shiftX3, posY+rectSize+shiftY3);
      vertex(posX+shiftX4, posY+rectSize+shiftY4);
      endShape(CLOSE);
    }
  } 
  
}


 void mousePressed() {
  actRandomSeed = (int) random(100000);
  colorMode(HSB, 100);
  stroke(random(30,70),random(60,30),80,50);
}



