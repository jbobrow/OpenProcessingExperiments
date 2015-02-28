
/*Bouncing Ball als Zeichenapparat.*/

float x = 300;
float y = 40;
float speedX = 6;
float speedY = 15;

void setup() {
  size(300, 300);
  colorMode(RGB, 255, 255, 255, 100);
  background(20, 60, 60);
  smooth();
}

void draw() {
  x = x + speedX;
  y = y + speedY;

  if ( x > width || x < 0) {
    speedX = speedX * -1;
  }
  if ( y > height || y < 0) {
    speedY = speedY * -1 ;
  }

  strokeWeight(random(1, 2.5));
  fill(random(0), random(255), random(255));

  float sizeBall = random(1, 7);
  ellipse(x, y, sizeBall, sizeBall);
}

/*void mousePressed() {
  saveFrame("thumbnail.png");
}*/


