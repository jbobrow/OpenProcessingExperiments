
int growingWidth = 0;
int growingHeight = 0;
int randomRed = 0;
int randomGreen = 0;
int randomBlue = 0;
int randomGray = 0;
int startX = 0;
int startY = 0;
int randomstrokeWeight = 0;
boolean boolGrowing = false; 

void setup() {

  size(1200, 600);
  background (0);
  frameRate(10);
}

void draw() {


  fill(0, 50);
  rect (0, 0, width, height);

  smooth();
  stroke (255);
  randomstrokeWeight =10;
  strokeWeight (random(randomstrokeWeight));
  randomRed=int(random(255)); 
  randomGreen =int(random(255));
  randomBlue=int(random(255));
  fill (randomRed, randomGreen, randomBlue);
//  growingWidth = int(random(200));
//  growingHeight = int(random(200));
  
  if (boolGrowing==true) {
    if (growingWidth <300) {
      growingWidth = int(random(200));
    }
    else {
      growingWidth=0;
    }
  }

  if (boolGrowing==true) {
    if (growingHeight <300) {
      growingHeight = int(random(200));
    }
    else {
      growingHeight=0;
    }
  }
  rect (mouseX, mouseY, growingWidth, growingHeight);
  
  for (int X = startX; X < 1+startX; X += 10) {
    stroke (255);
    randomstrokeWeight=10;
    strokeWeight (random(randomstrokeWeight));
    line(X, 0, 0, height);
    if (X == 10)
      X = 0;
  }
  startX += 100;

  for (int Y = startY; Y < 1+startY; Y += 10) {
    stroke (255);
    randomstrokeWeight=10;
    strokeWeight (random(randomstrokeWeight));
    line(0, Y, width, Y);
  }

  startY += 50;
  for (int Y = startY; Y < 1+startY; Y += 10) {
    if (startY > height) {
      randomGray=255;
      fill(random(randomGray));
      rect(0, 0, 2*Y-1200, Y-600);
    }
  }

  if (startX > 2 * width) {
    startX = 0; 
    startY = 0;
  }
}

void mouseClicked() {
  if (boolGrowing==false) {
    boolGrowing=true;
  }
  else {
    boolGrowing = false;
  }
  
}
