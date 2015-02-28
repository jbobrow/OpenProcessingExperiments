
float posX;
float velXD;
float velXI;

float posY;
float velYD;
float velYU;

void setup() {
  size(400,400);
  frameRate(100);
  background(255);
  smooth();
  
  fill(0);
  text("a = left", 15, 30); 
  text("s = right", 15, 50);
  text("w = up", 15, 70);
  text("z = down", 15, 90);

  posX = width/2;
  velXD = 1;
  velXI = -1;

  posY= height/2;
  velYD = 1;
  velYU = -1;

}

void draw () { 

  if (keyPressed && key == 's') {
    if (posX >= width) {
      velXD = 1;
      posX = width-1;
    }
    posX = posX + velXD;

    if (posX <= 0) {
      velXD = 1;
    }
    background(255);
  }
  mira(posX, posY, 20);

  if (keyPressed && key == 'a') {
    if (posX >= width) {
      velXI = -1;
      posX = width-1;      
    }
    posX = posX + velXI;

    if (posX <= 0) {
      velXI = -1;
      posX = 0;
    }
    background(255);
  }
  mira(posX, posY, 20);

  if (keyPressed && key == 'w') {
    if (posY >= height) {
      velYU = -1;
      posY = height-1;
    }
    posY = posY + velYU;

    if (posY <= 0) {
      velYU = -1;
      posY = 0;
    }
    background(255);
  }
  mira(posX, posY, 20);

  if (keyPressed && key == 'z') {
    if (posY > height) {
      velYD = 1;
      posY = height-1;
    }
    posY = posY + velYD;

    if (posY <= 0) {
      velYD = 1;
      posY = 0;
    }
    background(255);
  }
  mira(posX, posY, 20);

} 

void mira (float x, float y, float r1) {
  strokeWeight(1);  
  stroke(227,2,85);
  fill(210);
  ellipse (x, y,r1,r1);
  line (x-20, y, x+20, y);
  line (x, y-20, x, y+20); 


}










