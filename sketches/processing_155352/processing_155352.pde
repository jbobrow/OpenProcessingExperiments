
int posX;
int posY;
int vitX, vitY;
void setup() {
  size(500, 600);
  posX = width/2;
  posY = height/2;
  vitX = 5;
  vitY = 5;
}
void draw() {

  posX = posX + vitX;// update posX
  if (posX>width) {
    fill(random(255),random(255),random(255));
    posX = width;
    vitX = vitX*(-1);
  }
  if (posX<0) {
    posX = 0;
    vitX = -vitX;
  }

  posY = posY + vitY;
  if (posY>height) {
    fill(random(255),random(255),random(255));
    posY = height;
    vitY = vitY*(-1);
  }
  if (posY<0) {
    posY = 0;
    vitY = -vitY;
  }
  triangle(posX,posY,posX+20,posY+100,posX+60,posY+90);
}

