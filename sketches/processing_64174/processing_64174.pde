
float x = 0;
float y = 0;
float speedX = 22;
float speedY = 23;
 
void setup() {
  size(500, 200);
  smooth();
}
void draw() {
  background(255);
  x = x + speedX;
  y = y + speedY;
  if ((x > width) || (x < 0)) {
    speedX = speedX * -1;
  }
 
  if ((y > height) || (y < 0)) {
    speedY = speedY * -1;
  }
 
  noStroke();
  fill(50);
  ellipse(x, y, 199, 199);
  
}


