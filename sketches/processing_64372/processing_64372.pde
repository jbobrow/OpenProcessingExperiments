
/*Bouncing Ball mit einer Geschwindigkeit und Beschleunigung.*/

float x = 15;
float y = 15;
float speedX = 4;
float speedY = 4;
float speedUp = 0.5;

void setup() {
  size(300, 300);
  colorMode(RGB, 255, 255, 255, 100);
  background(255);
  smooth();
}

void draw() {
  fill(255, 255, 255, 20);
  rectMode(CENTER);
  rect(150, 150, 300, 300);

  x = x + speedX;
  y = y + speedY;
  speedY = speedY + speedUp;

  if ( x > width-15 || x < 15) {
    speedX = speedX * -1;
  }
  if ( y > height-15 || y < 15) {
    speedY = speedY * -0.9 ;
  }

  noStroke();
  fill(186, 139, 185);
  ellipse(x, y, 30, 30);
}

/*void mousePressed(){
 saveFrame("thumbnail.png");
 }*/

