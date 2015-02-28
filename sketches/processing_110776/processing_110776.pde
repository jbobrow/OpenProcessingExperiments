
int posX = 10;
int posY = 200;
int speedX = 5;
int speedY = 5;



void setup() {
  size(500, 500);
}

void draw() {
  background(0,45,255);

  posX = posX + (speedX);
  posY = posY + (speedY);

  if (posX >= width) {
    speedX = -5;
  }

  if (posX <= 0) {
    speedX = 5;
  }
  
  if (posY >= height) {
    speedY = -5;}
    
if (posY <= 0) {
  speedY = 5;}

  ellipse(posX, posY, 20, 20);
}
