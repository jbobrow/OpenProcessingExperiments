
/**
 * changing positions of stapled circles in a grid
 *   
 * MOUSE
 * position x          : horizontal position shift
 * position y          : vertical position shift
 * left click          : random position shift
 * 
 * KEYS
 * s                   : save png
 * p                   : save pdf
 */


import processing.pdf.*;
boolean savePDF = false;

float tileCountX = 5;
float tileCountY = 5;
int count = 0;
int colorStep = 4;
int endSize = 0;
int stepSize = 20;
int actRandomSeed = 0;

void setup() { 
  size(600, 600);
} 

void draw() { 
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  colorMode(HSB, 360, 100, 100); 
  smooth();
  noStroke();
  background(360); 
  randomSeed(actRandomSeed);
  stepSize = mouseX/10;
  endSize = mouseY/10;
  for (int gridY=0; gridY<= tileCountY; gridY++) {
    for (int gridX=0; gridX<= tileCountX; gridX++) {  

      // kachelgr?ssen und positionen
      float tileWidth = width / tileCountX;
      float tileHeight = height / tileCountY;
      float posX = tileWidth*gridX;
      float posY = tileHeight*gridY;
      switch(int(random(4))) {
      case 0: 
        // modul
        for(int i=0; i< stepSize; i++) {
          float diameter = map(i,0,stepSize,tileWidth,endSize);
          fill(360-(i*colorStep),100,100);
          ellipse(posX+i, posY+i, diameter,diameter);
        }
        break;
      case 1: 
        // modul
        for(int i=0; i< stepSize; i++) {
          float diameter = map(i,0,stepSize,tileHeight,endSize);
          fill(360-(i*colorStep),100,100);
          ellipse(posX+i, posY+i, diameter,diameter);
        }
        break;
      case 2: 
        // modul
        for(int i=0; i< stepSize; i++) {
          float diameter = map(i,0,stepSize,tileWidth,endSize);
          fill(360-(i*colorStep),100,100);
          ellipse(posX-i, posY-i, diameter,diameter);
        }
        break;
      case 3: 
        // modul
        for(int i=0; i< stepSize; i++) {
          float diameter = map(i,0,stepSize,tileHeight,endSize);
          fill(360-(i*colorStep),100,100);
          ellipse(posX-i, posY-i, diameter,diameter);
        }
        break;

      }
    }
  }
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
} 

void mousePressed() {
  actRandomSeed = (int) random(100000);
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
