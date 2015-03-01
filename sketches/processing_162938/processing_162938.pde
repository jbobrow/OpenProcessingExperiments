
float x = 50;
float y = 50;
int height = 200;
int width = 200;
float radius = 5;
float speedX = 2.25;
float speedY = 1.75;
int counter = 0;
int newCounter = 0;
float angleX = 0;
float angleY = 0;


void setup() {
  size(width, height);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
  background(#000000);
  fill(#ffffff);
  ////////// bounce ball ///////////
  ellipse(x, y, radius, radius);
  x += speedX;
  y += speedY;
  if (x > width-radius || x < radius) {
    speedX = -speedX + random(-.4,.4);
  }
  if (y > height-radius || y < radius) {
    speedY = -speedY + random(-.4,.4);
  }
  /////////// paddle ///////////
  rect(mouseX, 150, 20, 5);
  if (mouseX+20 > x && x > mouseX && 155 > y && y > 145) {
    speedX = -speedX + random(-.4,.4);;
    speedY = -speedY + random(-.4,.4);;
    newCounter = counter + 1;
  }
  /////////// text ///////////
  if (counter != newCounter) {
    counter = newCounter;
  }
      textSize(18);
    text("score: " + counter, 10, 20); 
}

