
PImage Water;
PImage Small;
PImage Big;
PImage Oct;
float sY = 0;
float sX = 0;
float bY = 0;
float bX = 0;
float oY = 0;
float oX = 0;
float sMoveY; //small
float sMoveX;
float bMoveY; //big
float bMoveX;
float oMoveY; //Oct
float oMoveX;
float maxSpeed = 3.0;
float radius = 20.0;
boolean sScared = false;

void setup() {
  size(500,400);
  //load images
  Water = loadImage("water.png");
  Small = loadImage("small.png");
  Big = loadImage("big.png");
  Oct = loadImage("oct.png");
  
  //set speed
  sMoveX=random(-maxSpeed, maxSpeed); 
  sMoveY=random(-maxSpeed, maxSpeed); 
  bMoveX=random(-maxSpeed, maxSpeed); 
  bMoveY=random(-maxSpeed, maxSpeed); 
  oMoveX=random(-maxSpeed, maxSpeed); 
  oMoveY=random(-maxSpeed, maxSpeed); 
  
  // sets the starting positions of fishes
  sX=random(width-radius); 
  sY=random(height-radius); 
  bX=random(width-radius); 
  bY=random(height-radius); 
  oX=random(radius*2, width-radius*2);  
  oY=random(radius*2, height-radius*2); 
  imageMode(CENTER);
}

void draw() {
  background(Water);
  
  //big fish
  bX+=bMoveX;
  bY+=bMoveY;
  if (bX>width-radius || bX<radius) {
    bMoveX=-bMoveX;
  }
  if (bY>width-radius || bY<radius) {
    bMoveY=-bMoveY;
  }
  image(Big, bX, bY, radius*2, radius*2);
    
  // Oct 
  oX+=oMoveX; 
  oY+=oMoveY;
  if (oX>width-radius || oX<radius) {
    oMoveX=-oMoveX;
  }
  if (oY>width-radius || oY<radius) {
    oMoveY=-oMoveY;
  }
  image(Oct, oX, oY, radius*3, radius*3);
   
  // Small Fish
  sX+=sMoveX;  
  sY+=sMoveY;
  if (sX>width-radius*2 || sX<radius*2) { 
    sMoveX=-sMoveX;
  }
  if (sY>width-radius*2 || sY<radius*2) {
    sMoveY=-sMoveY;
  }
  if (dist(bX, bY, sX, sY)<radius*2 || dist(oX, oY, sX, sY)<radius*2) { 
    if (sScared==false) {
      sMoveY=-sMoveY; 
      sMoveX=-sMoveX; 
      sScared=true;
    }
  }
  else {
    sScared=false; 
  }
  if (sScared==true) {
    sMoveY++; // speed increases if small fish is scared
    sMoveX++;
  }
  image(Small, sX, sY, radius*2, radius*2);
}


