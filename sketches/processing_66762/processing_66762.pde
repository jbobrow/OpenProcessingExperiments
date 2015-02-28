
//keyboardmovement k;

float xPos;
float yPos;
float speed = 20;
boolean moveLeft, moveRight, moveUp, moveDown = false;

void setup() {
  size(500, 500);
  smooth();
  xPos =250;
  yPos =250;
  speed = 2;
}

void draw() {
  background(80,90,100);
  mouse(80);
  mouse(60);
  mouse(40);
  mouse(20);
  move();
  display();
}


//keyboard interaction
void keyPressed() {

  if (keyCode == LEFT) {
    moveLeft = true;
  } 
  else if (keyCode == RIGHT) {
    moveRight = true;
  } 
  else if (keyCode == UP) {
    moveUp = true;
  } 
  else if (keyCode == DOWN) {
    moveDown = true;
  }
}

void keyReleased() {

  if (keyCode == LEFT) {
    moveLeft = false;
  } 
  else if (keyCode == RIGHT) {
    moveRight = false;
  } 
  else if (keyCode == UP) {
    moveUp = false;
  } 
  else if (keyCode == DOWN) {
    moveDown = false;
  }
}



void display () {
  ellipse (xPos, yPos, 50, 50);
}


void move() {
  if (moveUp) {
    yPos -= speed;
  }
  if (moveDown) {
    yPos += speed;
  } 
  if (moveLeft) {
    xPos -= speed;
  }
  if (moveRight) {
    xPos += speed;
  }
}


void mouse (int diameter) {
  fill(random(255), mouseY, mouseX);
  ellipse(mouseX, mouseY, diameter, diameter);
}
