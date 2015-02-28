
PImage w, f;
String s;
int tS = 16;
int imgSize = 50;
int score = 0;
int savedTime;
int totalTime;  
//player
float xPos;
float yPos;
float speed;
boolean moveLeft, moveRight, moveUp, moveDown;
boolean moveLeftE, moveRightE, moveUpE, moveDownE;
//enemy
float xPosE;
float yPosE;
float speedE;

 
void setup() {
  size(512, 512);
  smooth();
  noStroke();
  w = loadImage("wooster.png");
  f = loadImage("fograt.png");
  xPos = width/2;
  yPos = height/2;
  speed = 2;
  moveLeft = moveRight = moveUp = moveDown = false;
  xPosE = (float)Math.floor(random(0, width));
  yPosE = (float)Math.floor(random(0, height));
  savedTime = millis();
}
 
void draw() {
  int passedTime = millis() - savedTime;
  if (score==10){
    s = "Wooster Wins!";
    tS = 32;
    textSize(tS);
    textAlign(CENTER);
    text(s, width/2, height/2, 5);
    speed=0;
  }
  else if (passedTime>60000) {
    s = "Fograt Wins!";
    tS = 32;
    textSize(tS);
    textAlign(CENTER);
    text(s, width/2, height/2, 5);
    speed=0;
  }
  else{
    int tx = width-200;
    int ty = height-5;
    background(80);
    s = "Wooster's Score: "+score;
    fill(50);
    textSize(tS);
    text(s, tx, ty, 5);
    if(moveLeft) xPos -= speed;
    if(moveRight) xPos += speed;
    if(moveUp) yPos -= speed;
    if(moveDown) yPos += speed;

    if(moveLeftE) xPosE -= speed;
    if(moveRightE) xPosE += speed;
    if(moveUpE) yPosE -= speed;
    if(moveDownE) yPosE += speed;
    image(w, xPos, yPos, imgSize, imgSize);
    image(f, xPosE, yPosE, imgSize, imgSize);
    
    if(Math.abs(xPos-xPosE)<(imgSize/2)&&Math.abs(yPos-yPosE)<(imgSize/2)){
      xPosE = (float)Math.floor(random(0, width));
      yPosE = (float)Math.floor(random(0, height));
      score++;
    }
  }
}
 
 
//--------------------------------------
//KEYBOARD INPUT
 
void keyPressed() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       moveLeft = true;
     } else if(keyCode == RIGHT) {
       moveRight = true;
     } else if(keyCode == UP) {
       moveUp = true;
     } else if(keyCode == DOWN) {
       moveDown = true;
     }
  }
  else {  
    switch (key){
      case ('w') : case ('W') : moveUpE = true;  break;  
      case ('a') : case ('A') : moveLeftE = true;  break;  
      case ('s') : case ('S') : moveDownE = true;  break;  
      case ('d') : case ('D') : moveRightE = true;  break;  
    }
  }
}
 
void keyReleased() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       moveLeft = false;
     } else if(keyCode == RIGHT) {
       moveRight = false;
     } else if(keyCode == UP) {
       moveUp = false;
     } else if(keyCode == DOWN) {
       moveDown = false;
     }
  }
  else {  
    switch (key){
      case ('w') : case ('W') : moveUpE = false;  break;  
      case ('a') : case ('A') : moveLeftE = false;  break;  
      case ('s') : case ('S') : moveDownE = false;  break;  
      case ('d') : case ('D') : moveRightE = false;  break;  
    }
  }
}


