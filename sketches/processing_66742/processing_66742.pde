
int posX;
int posY;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  for (int posX=20;posX<500;posX=posX+50) {
  for (int posY=20;posY<500;posY=posY+50) {
  fill(posX,posY, random(255),random(255));
  ellipse(posX, posY, 20, 20);
  }  
  }
}


