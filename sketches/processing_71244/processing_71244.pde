
int centerX, centerY, numLips, numNails, numHands, distance, nailDistance, handsDistance;
float lipsAngleInc, nailsAngleInc, handsAngleInc, angleOfLips, angleOfNails, angleOfHands;
PImage lips, nails, hands, bloodCells1, bloodCells2, snakeskin, eye;
 
void setup() {
  size(600, 600);
  centerX = width/2;
  centerY = height/2;
  distance = 50;
  nailDistance = 200;
  handsDistance = 150;
  lipsAngleInc = 0;
  nailsAngleInc = 0;//angle increment for objects
  handsAngleInc = 0;
  numLips = 10;
  numHands = 5;
  
  angleOfLips = 360/numLips;
  angleOfHands = 360/numHands;
  
  
  
  lips = loadImage("Lips.png"); //the file has to be in the same folder 
  lips.resize(100,100);
  
  snakeskin = loadImage("snakeskin.png");
  snakeskin.resize(400, 400);
  
  bloodCells1 = loadImage("blood cells.png");
  bloodCells1.resize(575,575);
  bloodCells2 = loadImage("blood cells.png");
  bloodCells2.resize(825,825);
  
  eye = loadImage("eye.png");
  eye.resize(150, 150);
  
  hands = loadImage("hands.png");
  hands.resize(150, 150);
  
 
}
 
void draw() {
  background(255);
  lipsAngleInc++;
  handsAngleInc--;
  drawBloodOuterCircle();
  drawSnakeSkin();
  drawBloodInnerCircle();
  drawEye();
  drawLips();
  drawHands();
}

void drawHands() {
  for(int i = 0; i < numHands; i++) {
    pushMatrix();
      translate(centerX, centerY); //translate coordinate system
      rotate(radians(i*angleOfHands + handsAngleInc)); //rotate coordinate system
      translate(handsDistance,0);
      image(hands, 0, 0);
    popMatrix();
  }
}


void drawEye() {
   image(eye, centerX-eye.width/2, centerY-eye.height/2);
}

void drawSnakeSkin() {
   image(snakeskin, centerX-snakeskin.width/2, centerY-snakeskin.height/2);
}

void drawBloodInnerCircle() {
   image(bloodCells1, centerX-bloodCells1.width/2, centerY-bloodCells1.height/2);
}

void drawBloodOuterCircle() {
   image(bloodCells2, centerX-bloodCells2.width/2, centerY-bloodCells2.height/2);
}

void drawLips() {
  for(int i = 0; i < numLips; i++) {
    pushMatrix();
      translate(centerX, centerY); //translate coordinate system
      rotate(radians(i*angleOfLips + lipsAngleInc)); //rotate coordinate system
      translate(distance,0);
      image(lips, 0, 0);
    popMatrix();
  }
}

