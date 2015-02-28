
//Alex Lee, asl1@andrew.cmu.edu, HW8, 60-257
//Copyright Alex Lee Pittsburgh 2013

float oneX, oneY, oneVelX, oneVelY;
float twoX, twoY, twoVelX, twoVelY;
float velChange = 3;
float velAIChange = .2;
boolean endGame;
int hitTracker; 

int time;
int lastCollisionTime;

PImage leafImage1, leafImage2, bgImage, bgImage2;
int bgImage2Alpha = 0;
 
void setup() {
  size(400, 800);
  background(0);
  frameRate(30);
  restartGame();
}

void restartGame() {
  //soundOceanTimer.start();
  leafImage1 = loadImage("leaf2.png");
  leafImage2 = loadImage("leaf1.png");
  bgImage = loadImage("bg.jpg");
  bgImage2 = loadImage("bg2.jpg");
  oneX = random(100, width/2 - 100);
  oneY = random(100, height/2 - 100);
  twoX = random(width/2, width - 200);
  twoY = random(height/2, height - 200);
  oneVelX = 0;
  oneVelY = 0;
  twoVelX = 0;
  twoVelY = 0;
  hitTracker = 0;
  endGame = false;
  bgImage2Alpha = 0;
  lastCollisionTime = 0;
  time = millis();
}

void draw() {
  drawBackground();
  drawText();
  AIShip("Two");
  moveShip("One");
  moveShip("Two");
  wrapShip("One");
  bounceShip("Two");
  checkCollision();
  drawShip(1, oneX, oneY);
  drawShip(2, twoX, twoY);
   
}

void drawBackground() {
  tint(255, 255);
  image(bgImage, 0, 0);
  bgImage2Alpha -= 10;
  if(bgImage2Alpha < 0) {
    bgImage2Alpha = 0;
  }
  tint(255, bgImage2Alpha);
  image(bgImage2, 0, 0);
  tint(255, 255);
}

void drawText() {
  fill(255);
  textSize(200);
  textAlign(CENTER);
  int r = 60;
  text(hitTracker, width/2, height/3 + r - 20);
  int collisionLapsedTime = round((millis( ) - lastCollisionTime)/1000);
  text(collisionLapsedTime, width/2, height*2/3 + r+ 10);
}

void AIShip(String Ship) {
  if(Ship == "Two") {
    if(twoX < oneX) {
      twoVelX += velAIChange; 
    }
    else if(twoX > oneX) {
      twoVelX -= velAIChange; 
    }
    if(twoY < oneY) {
      twoVelY += velAIChange; 
    }
    else if(twoY > oneY) {
      twoVelY -= velAIChange; 
    }
  }
}

void moveShip(String Ship) {
  if(Ship == "One") {
    oneX += oneVelX;
    oneY += oneVelY;
  }
  else if(Ship == "Two") {
    twoX += twoVelX;
    twoY += twoVelY;
  }
}
 
 
void wrapShip(String Ship) {
  if(Ship == "One") {
    if(oneX > width) {
      oneX = -leafImage1.width;
    }
    else if(oneX < -leafImage1.width) {
      
    }
    if(oneY > height) {
      oneY = -leafImage1.height;
    }
    else if(oneY < -leafImage1.height) {
      
    }
  }
}
 
void bounceShip(String Ship) {
  if(Ship == "Two") {
    if(twoX >= width - leafImage1.width) {
      twoX = width - leafImage1.width;
      twoVelX *= -1;
    }
    else if(twoX <= 0) {
      twoX = 0;
      twoVelX *= -1;
    }
    if(twoY >= height - leafImage1.height) {
      twoY = height - leafImage1.height;
      twoVelY *= -1;
    }
    else if(twoY <= 0) {
      twoY = 0;
      twoVelY *= -1;
    }
  }
}

void checkCollision() {
  float d = dist(oneX + leafImage1.width/2, oneY + leafImage1.height/2, twoX + leafImage1.width/2, twoY + leafImage1.height/2);
  if(d < (leafImage1.width/2 + leafImage1.height/2)) {
    bgImage2Alpha = 255;
    lastCollisionTime = millis();
    hitTracker += 1; 
    oneVelX *= -1;
    oneVelY *= -1;
    twoVelX *= -1;
    twoVelY *= -1;
    //put restart game/endgame here(?) 
  }
}
 
void drawShip(int Leaf, float X, float Y) {
  if(Leaf == 1) {
    image(leafImage1, X, Y);
  }
  else if(Leaf == 2) {
    image(leafImage2, X, Y);
  }
}
 
void keyPressed() {
  //arrow keys and wasd
  if(endGame == false) {
    if (keyCode == UP) {
      oneVelY -= velChange;
    }
    if (keyCode == DOWN) {
      oneVelY += velChange;
    }
    if (keyCode == LEFT) {
      oneVelX -= velChange;
    }
    if (keyCode == RIGHT) {
      oneVelX += velChange;
    }
  }
  if (key == ' ') {
    restartGame();
  }
}


