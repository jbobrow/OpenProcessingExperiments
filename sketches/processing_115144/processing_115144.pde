
int circleX=200;
int circleY=0;
int circleW=20;
int speedX=1;
int speedY=2;
void setup() {
  size(500, 400);
}
void draw() { 
  background(0);
  circleX=circleX+speedX;
  circleY=circleY+speedY;
  ellipse(circleX, circleY, circleW, circleW);
  if (circleY>height) {
    speedY=-1*speedY;
    circleW=circleW+20;
    fill(255,0,0);
  }
  if (circleX>width) {
    speedX=-1*speedX;
    circleW=circleW+40;
    fill(255,255,0);
  }
  if (circleY<0) {
    speedY=-1*speedY;
    circleW=circleW+80;
    fill(0,153,0);
  }
    if (circleX<0) {
    speedX=-1*speedX;
    circleW=circleW+100;
    fill(0,0,255);
   }
}
