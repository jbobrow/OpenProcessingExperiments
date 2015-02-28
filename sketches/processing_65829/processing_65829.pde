
Player p;

void setup() {
 size(300, 300);
 smooth(); 
 noStroke();
 
 p = new Player(width/2, height/2);
  
}

void draw() {
  background(0);
  
  p.move();
  p.display();  
}


//--------------------------------------
//KEYBOARD INPUT

void keyPressed() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       p.moveLeft = true;
     } else if(keyCode == RIGHT) {
       p.moveRight = true;
     } else if(keyCode == UP) {
       p.moveUp = true; 
     } else if(keyCode == DOWN) {
       p.moveDown = true;
     }
  }
}

void keyReleased() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       p.moveLeft = false;
     } else if(keyCode == RIGHT) {
       p.moveRight = false;
     } else if(keyCode == UP) {
       p.moveUp = false; 
     } else if(keyCode == DOWN) {
       p.moveDown = false;
     }
  }
} 



//--------------------------------------
//PLAYER CLASS

class Player {
  float xPos;
  float yPos;
  float speed = 2;
  boolean moveLeft, moveRight, moveUp, moveDown = false;
  
  Player(float x_in, float y_in) {
    xPos = x_in;
    yPos = y_in;  
  }
  
  void display() {
    fill(255);
    noStroke();
    ellipse(xPos, yPos, 30, 30);
  }
  
  void move() {
    if(moveLeft) xPos -= speed;
    if(moveRight) xPos += speed;
    if(moveUp) yPos -= speed;
    if(moveDown) yPos += speed;  
  }
  
}
