
float x = 50.0;
float y = 50.0;
float speedX = 1.0;
float speedY = 0.4;
float rectWidth = 15.0;
float directionX = 1;
float directionY = -1;
float d = 20.0;

void setup() {
  size(100, 100);
  smooth();
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(0);
  fill(255, 0, 0);
  rect(x, y, rectWidth, rectWidth);
  fill(0, 180 , 120);
  ellipse(50, 50, d, d);
  d += speedY * directionY;
  
  x += speedX * directionX;
  if ((x > width-rectWidth) || (x < rectWidth)) {
    directionX= -directionX;
  }
  
  y += speedY * directionY;
  if((y >height-rectWidth) || (y<rectWidth)) {
    directionY= - directionY;
  }
  
  if ((d>width) || (d<width/10)) {
    directionY = -directionY;
  }
}
