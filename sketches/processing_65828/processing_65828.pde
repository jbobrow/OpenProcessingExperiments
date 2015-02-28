
float xPos;
float yPos;
float speed;
boolean moveLeft, moveRight, moveUp, moveDown;

void setup() {
  size(300, 300);
  smooth();
  noStroke();
  
  xPos = width/2;
  yPos = height/2;
  speed = 2; 
  moveLeft = moveRight = moveUp = moveDown = false; 
}

void draw() {
  background(0);
  
  if(moveLeft) xPos -= speed;
  if(moveRight) xPos += speed;
  if(moveUp) yPos -= speed;
  if(moveDown) yPos += speed;
  
  ellipse(xPos, yPos, 30, 30);
  
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
}
