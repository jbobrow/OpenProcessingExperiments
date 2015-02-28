
PImage gradient;
PImage needle;
PImage meter;
PImage backgroundimage;
PImage lightoff;
PImage lighton;
PImage lever;
PImage glass;

float x;
float y;
float wd;
float ht;

int threshHold;
int threshHold2;
int threshHold3;
int threshHold4;
float threshHold5;

int pathX, pathY, pathHeight;

int lightX, lightY, lightWidth, lightHeight, lightposx, lightposy;

int xposition;

int gameState;

float deg = 0;
float deg2;
float sec;
float inc;
float meterRotate;
float needleRotate;

void setup(){
  size(840, 800);
  gradient = loadImage("01gradient.png");
  needle = loadImage("02needle.png");
  meter = loadImage("03meter.png");
  backgroundimage = loadImage("04background.png");
  lightoff = loadImage("05lightoff.png");
  lighton = loadImage("06lighton.png");
  lever = loadImage("07lever.png");
  glass = loadImage("08glass.png");
  imageMode(CENTER);
  
  x = width/2;
  y = height/2;
  wd = 840;
  ht = 800;
  
  gameState = 0;
  
  deg2 =0;
  sec = 0;
  meterRotate = 0;
  needleRotate = 0;
    
  threshHold = 285;
  threshHold2 = -48;
  threshHold3 = 25;
  threshHold4 = 0;
  threshHold5 = 0;
  pathY = 120;
  pathX = 350;
  pathHeight = 285;
  
  lightX = 365;
  lightY = 628;
  lightWidth = 108;
  lightHeight = 108;
  
  
}

void draw(){
  drawGradient();
  if(gameState == 1){
    rotateMeter();
  }
  if(gameState == 2){
    springBack();
    rotateBack();
  }
  rotateNeedle();
  drawBackground();
  moveLever();
  rotateLight();
  drawGlass();
}

void moveLever(){
  int leverY = int(map(threshHold, 0, 285, pathY+pathHeight,pathY));
  if(threshHold < 20 && gameState == 0){
    gameState = 1;
  }
  image(lever, x, leverY, 178, 122);
}

void rotateLight(){
  int lightposx = int(map(threshHold2, -54, 54, lightX, lightX+lightWidth));
  int lightposy = int(map(threshHold3, 0, 108, lightY, lightY-lightHeight));
  if(gameState == 1){
    image(lighton, lightposx, lightposy, 35, 35);
  }else{
    image(lightoff, lightposx, lightposy, 17, 17);
  }
} 

void rotateNeedle(){
  pushMatrix();
    translate(x, 628);
    needleRotate = radians(deg);
    rotate(needleRotate);
    image(needle, 0, 0, 258, 145);
  popMatrix();
}

void mouseDragged(){
  int leverY = int(map(threshHold, 0, 285, pathY+pathHeight,pathY));
  if(dist(mouseX, mouseY, x, leverY) < 178/2){
    threshHold = int(constrain(map(mouseY, pathY+pathHeight, pathY, 0, 285), 0, 285));
  } else if(dist(mouseX, mouseY, 420, 628) < 80){
    threshHold2 = int(constrain(map(mouseX, lightX, lightX+lightWidth, -54, 54), -48, 48));
    threshHold3 = int(sqrt(2916 - (pow(threshHold2, 2))));
    threshHold4 = int(constrain(map(mouseX, lightX, lightX+lightWidth, 0, 123), 0, 123));
    threshHold5 = int(constrain(map(mouseX, lightX, lightX+lightWidth, 0, 180), 0, 59));
    deg = threshHold4;
  }
}

void rotateMeter(){
  int speed = int(deg2 += 0.5);
  pushMatrix();
    translate(x, 628);
    meterRotate = (constrain((radians(speed)), radians(0), radians(threshHold4)));
    rotate(meterRotate);
    if(speed == deg && threshHold < 20){
      gameState = 2;
    }
    image(meter, 0, 0, 344, 344);
  popMatrix();
}

void springBack(){
  int speedLever = int(inc += 20);
  threshHold = constrain(speedLever, 0, 285);
} 

void rotateBack(){
  int speedNeg = int(deg2 -= 3);
  pushMatrix();
    translate(x, 628);
    meterRotate = (constrain((radians(speedNeg)), radians(0), radians(deg)));
    rotate(meterRotate);
    if(meterRotate == 0  && threshHold >= 20){
      gameState = 0;
    }
    image(meter, 0, 0, 344, 344);
  popMatrix();
}

void drawBackground(){
  image(backgroundimage, x, y, wd, ht);
} 

void drawGlass(){
  image(glass, x, y, wd, ht);
}

void drawGradient(){
  image(gradient, x, y, wd, ht);
}


