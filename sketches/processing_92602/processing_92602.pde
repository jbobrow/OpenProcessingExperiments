
//Ayla El-Moussa
//Bouncing Ball 


float x;
float y;
float speedX;
float speedY;
void setup() {
  size(300, 500);
  frameRate(24);
  smooth();
  background(255);
  x = width/2;
  y = height/2;
  speedX = 5;
  speedY = 5;
}

void draw() {

  fill (255,0,164,random(255));
  //noStroke();
  ellipse(x, y, 30, 30);

  x = x + speedX;
  y = y + speedY;


 
  if (x > width || x < 0) {
    speedX *= - 1;
  }

  if (y > height || y < 0) {
    speedY *= - 1;
  }
}
