
//Alex Lee, asl1@andrew.cmu.edu, 60-257
//Copyright Alex Lee Pittsburgh 2013

/*
whenever they collide, they take damage? can only move slower?
maybe only the wrapping one takes damage, has to avoid the other one? 



*/

float oneX, oneY, oneVelX, oneVelY;
float twoX, twoY, twoVelX, twoVelY;
float velChange = .2;
int oneTint, twoTint;
boolean endGame;

PImage shipImage, fireImage, bgImage; 

void setup() {
  size(800, 800);
  background(0);
  frameRate(30);
  restartGame();
}

void restartGame() {
  shipImage = loadImage("ship.png");
  fireImage = loadImage("fire.png");
  bgImage = loadImage("bg.jpg");
  oneX = random(100, width/2 - 100);
  oneY = random(100, height/2 - 100);
  twoX = random(width/2, width - 200);
  twoY = random(height/2, height - 200);
  oneVelX = 0;
  oneVelY = 0;
  twoVelX = 0;
  twoVelY = 0;
  oneTint = 0;
  twoTint = 0;
  endGame = false;
}

void draw() {
  drawBackground();
  moveShip("One");
  moveShip("Two");
  wrapShip("One");
  bounceShip("Two");
  checkCollision();
  drawShip(1, oneTint, oneX, oneY);
  drawShip(2, twoTint, twoX, twoY);
  
}

void drawBackground() {
  image(bgImage, 0, 0);
  textSize(12);
  textAlign(CENTER);
  fill(255);
  int r = 10;
  text("Use the WASD keys to control Ship 1 and the ARROW keys to control Ship 2.", width/2, 388 + r);
  text("Ship 1 must avoid contact with Ship 2. If they collide five times, Ship 1 overheats.", width/2, 400 + r);
  text("Press SPACE to restart.", width/2, 412 + r);
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
      oneX = -shipImage.width;
    }
    else if(oneX < -shipImage.width) {
      oneX = width;
    }
    if(oneY > height) {
      oneY = -shipImage.height;
    }
    else if(oneY < -shipImage.height) {
      oneY = height;
    }
  }
}

void bounceShip(String Ship) {
  if(Ship == "Two") {
    if(twoX >= width - shipImage.width) {
      twoX = width - shipImage.width;
      twoVelX *= -1;
    }
    else if(twoX <= 0) {
      twoX = 0;
      twoVelX *= -1;
    }
    if(twoY >= height - shipImage.height) {
      twoY = height - shipImage.height;
      twoVelY *= -1;
    }
    else if(twoY <= 0) {
      twoY = 0;
      twoVelY *= -1;
    }
  }
}





void checkCollision() {
  /*
  float d = dist(x1, y1, x2, y2);
  if(d < (sz1/2 + sz2/2)) {
    collision
  }
  */
  
  float d = dist(oneX + shipImage.width/2, oneY + shipImage.height/2, twoX + shipImage.width/2, twoY + shipImage.height/2);
  if(d < (shipImage.width/2 + shipImage.height/2)) {
    oneVelX *= -1;
    oneVelY *= -1;
    twoVelX *= -1;
    twoVelY *= -1;
    
    //tint increase
    oneTint += 52;
    if(oneTint > 255) {
      oneTint = 255;
      oneVelX = 0;
      oneVelY = 0;
      twoVelX = 0;
      twoVelY = 0;
      endGame = true;
    }
  }
  
}

void drawShip(int Ship, int Tint, float X, float Y) {
  tint(255, 255 - Tint, 255 - Tint);
  image(shipImage, X, Y);
  fill(255);
  textSize(20);
  textAlign(LEFT);
  int r;
  if(endGame) {r = 0;}
  else{r = 3;}
  text(Ship, X + 43 + random(-r, r), Y + 54 + random(-r, r));
  tint(255);
}

void drawFire(String Ship, String Direction) {
  //draw fire is located in the key press
  float tempX = 0;
  float tempY = 0;
  float tempDisX = 0;
  float tempDisY = 0;
  float tempRotate = 0; 
  if(Ship == "One") {
    tempX = oneX + shipImage.width/2;
    tempY = oneY + shipImage.height/2;
  }
  else if(Ship == "Two") {
    tempX = twoX + shipImage.width/2;
    tempY = twoY + shipImage.height/2;
  }
  if(Direction == "Up") {
    tempRotate = 90;
    tempDisX = 0;
  }
  else if(Direction == "Left") {
    tempRotate = 0;
  }
  else if(Direction == "Down") {
    tempRotate = 270;
  }
  else if(Direction == "Right") {
    tempRotate = 180;
  }
  pushMatrix();
  translate(tempX, tempY);
  rotate(radians(tempRotate));
  image(fireImage, 50, -50);
  popMatrix();
}

void keyPressed() {
  //arrow keys and wasd
  if(endGame == false) { 
    if (keyCode == UP) {
      twoVelY -= velChange;
      drawFire("Two", "Up");
    }
    if (keyCode == DOWN) {
      twoVelY += velChange;
      drawFire("Two", "Down");
    }
    if (keyCode == LEFT) {
      twoVelX -= velChange;
      drawFire("Two", "Left");
    }
    if (keyCode == RIGHT) {
      twoVelX += velChange;
      drawFire("Two", "Right");
    }
    if (key == 'w') {
      oneVelY -= velChange;
      drawFire("One", "Up");
    }
    if (key == 's') {
      oneVelY += velChange;
      drawFire("One", "Down");
    }
    if (key == 'a') {
      oneVelX -= velChange;
      drawFire("One", "Left");
    }
    if (key == 'd') {
      oneVelX += velChange;
      drawFire("One", "Right");
    }
  }
  if (key == ' ') {
    restartGame();
  }
}




/*

int timestwo(int dVal) {
  dVal = dVal * 2;
  return dVal;  // Returns an int of 60, in this case
}
*/



