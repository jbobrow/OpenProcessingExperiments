
int posX = 0;
int speedX = 4;
int posY = 0;
int speedY = 2;

int posX2 = 0;
int speedX2 = 6;
int posY2 = 0;
int speedY2 = 3;


void setup() {
  size(800, 500);
}

void draw() {
  background(0);

  posX = posX + speedX;
  
   posY = posY + speedY;
   
  
  if (posX >= width || posX <= 0) {
    speedX *= -1;
  }
  
   if (posY >= height || posY <= 0) {
    speedY *= -1;
  }
  
   posX2 = posX2 + speedX2;
  
   posY2 = posY2 + speedY2;
   
  
  if (posX2 >= width || posX2 <= 0) {
    speedX2 *= -1;
  }
  
   if (posY2 >= height || posY2 <= 0) {
    speedY2 *= -1;
  }
  
  fill(255,255,255);
  ellipse(posX, posY, 200, 200);
  
  fill(0,0,0);
  ellipse(posX, posY, 180, 180);
  
  fill(255,255,0);
  ellipse(posX, mouseY, 50, 50);
  
   fill(255,255,255);
  ellipse(posX2, posY2, 200, 200);
  
  fill(0,0,0);
  ellipse(posX2, posY2, 180, 180);
  
  fill(255,255,0);
  ellipse(mouseX, posY2, 50, 50);
}


