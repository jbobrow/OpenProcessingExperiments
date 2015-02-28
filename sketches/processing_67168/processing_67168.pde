
// Fire
int numFire = 150;
float[] XFirePos = new float[numFire];
float[] YFirePos = new float[numFire];
float[] XFireVel = new float[numFire];
float[] YFireVel = new float[numFire];
color[] CFire = new color[numFire];
float gravity;

//Sub
int xSubPos = 100;
int ySubPos;
int numWeapon = 30;

// Cow
int numCow = 4;
float[] xCowPos = new float[numCow];
float[] yCowPos = new float[numCow];
PImage[] imgCow = new PImage[numCow];
float[] yCowVel = new float[numCow]; //Vel


//Font
PFont instFont;
int xFontPos = 100;
int yFontPos = 50;
int scoreCounter;

void setup() {
  size(600, 400);
  background(0, 0, 255);
  noStroke();
  smooth();
  
  instFont = createFont("System", 12, true);
  
  gravity = 0.1;
  ySubPos = height/2;
  // fire
  
  for(int i = 0; i < XFirePos.length; i++) {
    XFirePos[i] = 0;
    YFirePos[i] = 0;
    XFireVel[i] = 0;
    XFireVel[i] = 0;
  }
  // random cow xPos
  for(int i = 0; i < numCow; i++) {
    xCowPos[i] = random(450, 550);
    yCowPos[i] = random(height/2);
    yCowVel[i] = random(1, i+1);
  }
}

void draw() {
  background(0, 0, 255);
  imageMode(CENTER);
  PImage imgSub = loadImage("sub.png");
  image(imgSub, xSubPos, ySubPos);
  
  for(int i = 0; i < numCow; i++) {
  imgCow[i] = loadImage("cow.png");
  image(imgCow[i], xCowPos[i], yCowPos[i]);
  cowMove();

  }
  
  fill(255, 255, 255);
  textFont(instFont);
  text("COW_SUB (Beta 0.5)"
  , 20, 30);
  text("UP, DOWN, RIGHT"
  , 20, 50);
  text("score counter: " + scoreCounter
  , 20, 70);
  
  if (keyCode == RIGHT) {
    for(int i = 0; i < numWeapon; i++){
      fireWeapon(70 + xSubPos + i*15 , ySubPos + 10, i);
    }
  }
  
  for(int i = 0; i < numFire; i++) {
    XFirePos[i] += XFireVel[i];
    YFirePos[i] += YFireVel[i];
    YFireVel[i] += gravity; 
  
  }
  

  for(int j = 0; j < XFirePos.length; j++) {
    fill(CFire[j]);
    rectMode(CENTER);
    rect(XFirePos[j], YFirePos[j], 5, 5);
  }
 }
//Functions

void fireWeapon(float xWeaponPos, float yWeaponPos, int i) {
  fill(255 - i, i*20 , 100);
  rectMode(CENTER);
  rect(xWeaponPos, yWeaponPos, 4, 4);
}

void cowMove() {
  for(int i = 0; i < numCow; i++) {
    yCowPos[i] += yCowVel[i];
    
    if(yCowPos[i] > height-33 || yCowPos[i] < 33) {
      yCowVel[i] *= -1;
    }
  }
}
// Controller
void keyPressed() {
  for(int i = 0; i < numCow; i++) {
  if (keyCode == RIGHT || ySubPos == yCowPos[i]) {
    numCow -= 1;
    scoreCounter += 1;
    
    //Bomb!
    for(int j = 0; j < numFire; j++) {
      XFirePos[j] = xCowPos[i];
      YFirePos[j] = yCowPos[i];
      
      XFireVel[j] = random(-15, 0);
      YFireVel[j] = random(-2, 1);
      
      colorMode(HSB);
      CFire[j] = color(random(0, 30), 255, 255, 200);
      colorMode(RGB);
    }
  }
 }
  if (keyCode == DOWN) {
    ySubPos += 10;
  }
  if (keyCode == UP) {
    ySubPos -= 10;
  }

}

