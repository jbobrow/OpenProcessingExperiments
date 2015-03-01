
float mouthSize;
float pacX;
float pacY;
float velocity;
float direcX;
float direcY;
float distX;
float distY;
float distance;
float colour;

void setup() {
  size(750, 750);
  mouthSize = PI/5;
  pacX = width/2;
  pacY = height/2;
  direcX = 1;
  direcY = 1;
  velocity = 100;
  background(0, 0, 0);
  fill(255, 255, 0);
  arc(pacX, pacY, 100, 100, mouthSize, 2*PI - mouthSize);
}

void draw() {
  
  if(mouseX < pacX) {
    direcX = 1;
  } else {
    direcX = -1;
  }
  if(mouseY < pacY) {
    direcY = 1;
  } else {
    direcY = -1;
  }
  
  colour = 255 / (distance / 255);
  
  //---restricts movement off the screen
  if(pacX > 740) {
    direcX = direcX * -1;
  }
  if(pacX < 10) {
    direcX = direcX * -1;
  }
  if(pacY > 740) {
    direcY = direcY * -1;
  }
  if(pacY < 10) {
    direcY = direcY * -1;
  }
  //-------------------
  
  distX = abs(mouseX - pacX);
  distY = abs(mouseY - pacY);
  distance = dist(mouseX, mouseY, pacX, pacY);
  background(0, 0, 0);
  pacX += (velocity / (distX + distance)) * direcX;
  pacY += (velocity / (distY + distance)) * direcY;
  fill(255, colour, 0);
  arc(pacX, pacY, 100, 100, mouthSize, 2*PI - mouthSize);
}
