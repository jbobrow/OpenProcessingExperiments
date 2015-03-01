
float speedX = 3.0;
float speedY = 3.5;


float PosX;
float PosY;


void setup() {
  size(600, 600);
  frameRate(40);
  background(0);
}
void draw() {
  background(0);
  
  ellipse(PosX,PosY, 100, 100);
  fill(40,116,111);
  PosX = PosX + speedX;
  if (PosX > width) {
   speedX = -speedX;
  }
  if (PosX < 0) {
    speedX = -speedX;
  }
    ellipse(PosX+20,PosX+20, 100, 100);
    fill(40,116,111);
  PosX = PosX + speedX;
  if (PosX > width) {
   speedX = -speedX;
  }
  if (PosX < 0) {
    speedX = -speedX;
  }
  

  ellipse(PosY,PosX, 100, 100);
    fill(250,50,10);
  PosY = PosY + speedY;
  if (PosY > width) {
   speedY = -speedY;
  }
  if (PosY < 0) {
    speedY = -speedY;
  }
 ellipse(PosY+20,PosY+20, 100, 100);
  PosY = PosY + speedY;
  if (PosY > width) {
   speedY = -speedY;
  }
  if (PosY < 0) {
    speedY = -speedY;
  }

   
}



