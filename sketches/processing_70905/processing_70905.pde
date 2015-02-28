
float x = 50;
float y = 100;
float rad = 75;
float speedY = 2;
int speedX = 5;




void setup() {
  size(1000,600);
  smooth();
  frameRate(60);
}


void draw() {
  drawBall();
  ballInMotion();
  gravity();
  
}

void drawBall() {
  background(0);
  strokeWeight(5);
  stroke(255);
  ellipse(x, y, rad, rad);
  
  
}

void ballInMotion() {
  
  //x = (x + speedX)%(width + speedX + rad);
  x = x + speedX;
  if (x >= (width - (rad/2)) || x <= (rad/2)) {
    speedX = speedX * (-1);
  }
}

void gravity() {
  
  float grav = 0.5;
  y = y + speedY;
  speedY = speedY + grav;
  if(y>=height || y-(rad/2)<0) {
    speedY = speedY * (-0.95);
  }
}

void mousePressed() {
  
  x = mouseX;
  y = mouseY;
  
}

