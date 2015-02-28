
PImage[] bgImages = new PImage[6];
int whichImage = 0;
boolean drawNextImage = true;

int changeSpeed = 5;

PImage instructionsImage;
PImage conesImage;
PImage trianglesImage;
PImage squaresImage;
PImage plainImage;
PImage circlesImage;
int maxShapes = 100;

float[] drawnShapesX = new float[maxShapes];
float[] drawnShapesY = new float[maxShapes];
int[] drawnShapesSizeX = new int[maxShapes];
int[] drawnShapesSizeY = new int[maxShapes];
float[] rotationAmount = new float[maxShapes];

int[] whichShape = new int[maxShapes];


int shapeCounter = 0;

void setup() {
  size(800, 600);
  smooth();
  noStroke();
  fill(80);
  rectMode(CENTER);

  instructionsImage = loadImage("instructions.png");
  circlesImage = loadImage("circle1.png");
  plainImage = loadImage("WHITEPAPER.png");
  squaresImage = loadImage("SQUARE1.png");
  conesImage = loadImage("COMP.png");
  trianglesImage = loadImage("triangle1.png");

  bgImages[0] = instructionsImage;
  bgImages[1] = circlesImage;
  bgImages[2] = squaresImage;
  bgImages[3] = trianglesImage;
  bgImages[4] = conesImage;
  bgImages[5] = plainImage;

  for (int i = 0; i < maxShapes; i++) {
    whichShape[i] = 0;
    drawnShapesSizeX[i] = 40;
    drawnShapesSizeY[i] = 40;
    rotationAmount[i] = 0;
  }
}

void draw() {

  image(bgImages[whichImage], 0, 0);

  //  background(255);
  drawHoverShape();
  for (int i = 0; i < shapeCounter; i++) {
    drawShape(i);
  }

  whichShape[shapeCounter+1] = whichShape[shapeCounter];
  drawnShapesSizeX[shapeCounter+1] = drawnShapesSizeX[shapeCounter];
  drawnShapesSizeY[shapeCounter+1] = drawnShapesSizeY[shapeCounter];
  rotationAmount[shapeCounter+1] = rotationAmount[shapeCounter];
}



void mouseReleased() {
  rememberShape();
}


//first shape hovers on mouse
void drawHoverShape() {
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(rotationAmount[shapeCounter]);
  if (whichShape[shapeCounter] == 0) {
    ellipse(0, 0, drawnShapesSizeX[shapeCounter], drawnShapesSizeY[shapeCounter]);
  }
  if (whichShape[shapeCounter] == 1) {
    rect(0, 0, drawnShapesSizeX[shapeCounter], drawnShapesSizeY[shapeCounter]);
  }
  if (whichShape[shapeCounter] == 2) {
    drawTriangle(0, 0, drawnShapesSizeX[shapeCounter], drawnShapesSizeY[shapeCounter]);
  }
  popMatrix();
}

//once youre happy you click, and it remembers where you want to put it
void rememberShape() {
  drawnShapesX[shapeCounter] = mouseX; 
  drawnShapesY[shapeCounter] = mouseY; 

  shapeCounter ++;
}


//on the next frame after it erases everything, you need to redraw the shapes you stamped—this does that :o)
void drawShape(int shapeID) {
  pushMatrix();
  translate(drawnShapesX[shapeID], drawnShapesY[shapeID]);
  rotate(rotationAmount[shapeID]);
  if (whichShape[shapeID] == 0) {
    ellipse(0, 0, drawnShapesSizeX[shapeID], drawnShapesSizeY[shapeID]);
  }
  if (whichShape[shapeID] == 1) {
    rect(0, 0, drawnShapesSizeX[shapeID], drawnShapesSizeY[shapeID]);
  }
  if (whichShape[shapeID] == 2) {
    drawTriangle(0, 0, drawnShapesSizeX[shapeID], drawnShapesSizeY[shapeID]);
  }
  popMatrix();
}

void drawTriangle(float x, float y, int sizeX, int sizeY) {
  triangle(x - sizeX/2, y+sizeY/2, x+sizeX/2, y+sizeY/2, x, y-sizeY/2);
}


void keyPressed() {
  if (key == '1') {
    whichShape[shapeCounter] = 0;
  }
  if (key == '2') {
    whichShape[shapeCounter] = 1;
  }
  if (key == '3') {
    whichShape[shapeCounter] = 2;
  }
  if (key == '-') {
    rotationAmount[shapeCounter] -= PI/8;
  }
  if (key == '=') {
    rotationAmount[shapeCounter] += PI/8;
  }
  if (key == ' ') {
    if (whichImage<5) {
      whichImage ++;
    }
    else {
      whichImage=0;
    }
    shapeCounter=0;
  }

  if (key == CODED) {
    if (keyCode == UP) {
      drawnShapesSizeY[shapeCounter]+=changeSpeed;
    }
    if (keyCode == DOWN) {
      if (drawnShapesSizeY[shapeCounter] > changeSpeed) {  
        drawnShapesSizeY[shapeCounter]-=changeSpeed;
      }
    }
    if (keyCode == RIGHT) {
      drawnShapesSizeX[shapeCounter]+=changeSpeed;
    }
    if (keyCode == LEFT) {
      if (drawnShapesSizeX[shapeCounter] > changeSpeed) {  
        drawnShapesSizeX[shapeCounter]-=changeSpeed;
      }
    }
  }
}


