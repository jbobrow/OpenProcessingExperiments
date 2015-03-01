
int dragX, dragY, moveX, moveY, sizeX, sizeY, bckgrnC;


void setup() {
  size(600,600);
  smooth();
  noStroke();
  sizeX= 10;
  sizeY = 10;
  bckgrnC = 100;
}

void draw() {
  background(100, bckgrnC, 200);
  fill(20, bckgrnC, 40);
  ellipse(dragX, dragY, sizeX, 33); 
  fill(153, bckgrnC, bckgrnC);
  ellipse(moveX, moveY, sizeX, sizeY);
}

void mouseMoved() {
  moveX = mouseX;
  moveY = mouseY;
}

void mouseDragged() {
  dragX = mouseX;
  dragY = mouseY;
}

void mouseReleased() {
  moveX = moveX*2;
  bckgrnC = 200;
  sizeX = sizeX*2;
  sizeY = sizeX*2;
  moveY = moveY*2;
  sizeY = sizeY/2;
}


  

  


