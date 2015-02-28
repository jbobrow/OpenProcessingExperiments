
//red
float x1;
float y1;
float speedX1 = 8;
float speedY1 = 2;
int borderX = 250;

//blue
float x2 = 0;
float y2 = 400;
float speedX2 = 6;
float speedY2 = 10;
int borderY = 250;


void setup() {
  size(400,400);
  noStroke();
}

void draw() {
  //MOVEMENT
  //red
  x1+= speedX1;
  y1+= speedY1;
  //blue
  x2+= speedX2;
  y2+= speedY2;
  
  background(50, 150, 255);
  
  rect(250+30,0,400-250,200);
  
  //red
  fill(255,0,0);
  ellipse(x1,y1,30,30);
  
  //blue
  fill(255);
  ellipse(x2,y2,60,60);
  
  //wrap
  //red
  if (x1 > borderX) {
    speedX1 *= -1;
  }
  
  if (x1 < 0) {
    speedX1 *= -1;
  }
  
  if (y1 > height) {
    speedY1 *= -1;
  }
  
  if (y1 < 0) {
    speedY1 *= -1;
  }
  
  //blue
  
  if (x2 > width) {
    speedX2 *= -1;
  }
  
  if (x2 < 0) {
    speedX2 *= -1;
  }
  
  if (y2 > height) {
    speedY2 *= -1;
  }
  
  if (y2 < borderY) {
    speedY2 *= -1;
  }
  
}

