
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/77240*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//I used a lot of the code from the example. in this case the player is the white circle the Creeper is the green circle and the ocelot is the red circle. The player is afraid of both the Ocelot and the Creeper(Lets face it he's a wimp) 
//and the Creeper is afraid of the ocelott
float cY = 0; 
float cX = 0; 
float bY = 0; 
float bX = 0; 
float aY = 0; 
float aX = 0; 
float cMoveY; 
float cMoveX; 
float bMoveY; 
float bMoveX; 
float aMoveY; 
PImage forest;
PImage ocelot;
PImage player;
PImage creeper;
float aMoveX;
float maxSpeed = 10.0;
float radius = 125.0; 
boolean bScared = false;
boolean aBrave = false;
boolean cScared = false; 
void setup() {
  size(1280, 800); 
  forest = loadImage("forest.png");
  player = loadImage("player.png");
  creeper = loadImage("creeper.png");
  ocelot = loadImage("ocelot.png");
  cMoveX=random(-maxSpeed, maxSpeed); 
  cMoveY=random(-maxSpeed, maxSpeed); 
  bMoveX=random(-maxSpeed, maxSpeed); 
  bMoveY=random(-maxSpeed, maxSpeed); 
  aMoveX=random(-maxSpeed, maxSpeed); 
  aMoveY=random(-maxSpeed, maxSpeed);
  aX=random(width-radius); 
  aY=random(height-radius); 
  bX=random(width-radius); 
  bY=random(height-radius);
  cX=random(radius*2, width-radius*2);  
  cY=random(radius*2, height-radius*2); 
  ellipseMode(RADIUS);
}
void draw() {
  background(0);
  image(forest, 0, 0);
  aX+=aMoveX; 
  aY+=aMoveY;
  if (aX>width-radius/4 || aX<radius/4) {
    aMoveX=-aMoveX;
  }
  if (aY>width-radius/2 || aY<radius/2) {
    aMoveY=-aMoveY;
  }
   if (dist(bX, bY, aX, aY)<radius*2) { 
    if (aBrave==false) {
      aMoveY= bMoveY; 
      aMoveX= bMoveX; 
      aBrave=true;
    }
  }
  else {
    aBrave=false; 
  }
  if (aBrave==true) { 
  }
  else { 
  }
  image(ocelot, aX, aY, radius, radius);
  bX+=bMoveX; 
  bY+=bMoveY;
  if (bX>width-radius/5 || bX<radius/5) { 
    bMoveX=-bMoveX;
  }
  if (bY>width-radius/4 || bY<radius/4) {
    bMoveY=-bMoveY;
  }
  if (dist(aX, aY, bX, bY)<radius*2) { 
    if (bScared==false) {
      bMoveY=-bMoveY; 
      bMoveX=-bMoveX; 
      bScared=true;
    }
  }
  else {
    bScared=false; 
  }
  if (bScared==true) { 
  }
  else { 
  }
  image(creeper, bX, bY, radius, radius);
  cX+=cMoveX;  
  cY+=cMoveY;
  if (cX>width-radius/5 || cX<radius/5) {
    cMoveX=-cMoveX;
  }
  if (cY>width-radius/4 || cY<radius/4) {
    cMoveY=-cMoveY;
  }
  if (dist(aX, aY, cX, cY)<radius*2 || dist(bX, bY, cX, cY)<radius*2) { 
    if (cScared==false) {
      cMoveY=-cMoveY; 
      cMoveX=-cMoveX; 
      cScared=true;
    }
  }
  else {
    cScared=false; 
  }
  if (cScared==true) { 
  }
  else { 
  }
  image(player, cX, cY, radius, radius); 
}

