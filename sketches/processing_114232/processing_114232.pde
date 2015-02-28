


float posX = random(400);
float posY = random(400);
float X = random(-5, 5);
float Y = random(-5, 5);
int y;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {

  noStroke();
  fill((int)random(10, 100), (int)random(200, 255), 0);
  rect (posX, posY, 20, 20);
  posX = posX + X;
  posY = posY + Y;

  if (posX > width-10 || posX <10 ) {
    Y += random(-1, 1);
    X =  - X;
  }

  if (posY> height-10 || posY < 10) {
    X += random(-1, 1);
    Y = - Y;
  }
}



