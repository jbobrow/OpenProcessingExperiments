

PShape currentShape;
PImage full;
import ddf.minim.*;
Minim minim;
AudioSample mymix;

int tileCount = 10;
float tileWidth, tileHeight;
float shapeSize = 50;
float newShapeSize = shapeSize;
float shapeAngle = 0;
float maxDist;

color shapeColor1 = color(0,132,178);
color shapeColor2 = color(112,178,0);
color shapeColor3 = color(43,0,75);
int fillMode = 0;
int sizeMode = 0;


void setup(){
  size(800, 800);
  background(255);
  smooth();
  full = loadImage("full.png");
  minim = new Minim(this);
  mymix = minim.loadSample("mymix.mp3");
  
  tileWidth = width/float(tileCount);
  tileHeight = height/float(tileCount);
  maxDist = sqrt(sq(width)+sq(height));

  currentShape = loadShape("module_1.svg");
} 


void draw(){

  background(255);
  smooth();
  image(full, 0, 0);
 

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      float posX = tileWidth*gridX + tileWidth/2;
      float posY = tileHeight*gridY + tileWidth/2;

      // calculate angle between mouse position and actual position of the shape
      float angle = atan2(mouseY-posY, mouseX-posX) + radians(shapeAngle);

      if (sizeMode == 0) newShapeSize = shapeSize;
      if (sizeMode == 1) newShapeSize = shapeSize*1.5-map(dist(mouseX,mouseY,posX,posY),0,500,5,shapeSize);
      if (sizeMode == 2) newShapeSize = map(dist(mouseX,mouseY,posX,posY),0,500,5,shapeSize);

      if (fillMode == 0) currentShape.enableStyle();
      if (fillMode == 1) {
        currentShape.disableStyle();
        fill(shapeColor1);      
      }
      if (fillMode == 2) {
        currentShape.disableStyle();
        float a = map(dist(mouseX,mouseY,posX,posY), 0,maxDist, 255,0);
        fill(shapeColor2, a);      
      }
      if (fillMode == 3) {
        currentShape.disableStyle();
        float a = map(dist(mouseX,mouseY,posX,posY), 0,maxDist, 0,255);
        fill(shapeColor3, a);      
      }

      pushMatrix();
      translate(posX, posY);
      rotate (angle);
      shapeMode (CENTER);

      noStroke();
      shape(currentShape, 0,0, newShapeSize,newShapeSize);
      popMatrix();
    }
  }
}


void keyPressed() {
  if (key == 'c' || key == 'C') fillMode = (fillMode+1) % 4;
  if (key == 'd' || key == 'D') sizeMode = (sizeMode+1) % 3;

  if (key == 'g' || key == 'G') {
    tileCount = tileCount+5;
    if (tileCount > 20) {
      tileCount = 10;
    }
    tileWidth = width/float(tileCount);
    tileHeight = height/float(tileCount);
  }
  
  if (key == '1') currentShape = loadShape("module_1.svg");
  if (key == '2') currentShape = loadShape("module_2.svg");
  if (key == '3') currentShape = loadShape("module_3.svg");
  if (key == '4') currentShape = loadShape("module_4.svg");
  if (key == '5') currentShape = loadShape("module_5.svg");
  if (key == '6') currentShape = loadShape("module_6.svg");
  if (key == '7') currentShape = loadShape("module_7.svg");

  if (keyCode == UP) shapeSize +=5;
  if (keyCode == DOWN) shapeSize = max(shapeSize-5, 5);
  if (keyCode == LEFT) shapeAngle -=5;
  if (keyCode == RIGHT) shapeAngle +=5;
  if ( key == 'm' ) mymix.trigger();
  if ( key == 'm' ) println("sample triggered");
}












