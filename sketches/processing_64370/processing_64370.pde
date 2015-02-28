
/*Bouncing Ball mit horizontaler und vertikaler Bewegung.*/

float x = 30;
float y = 30;
float speedX = 2;
float speedY = 10;

void setup() {
  size(300, 300);
  colorMode(RGB, 255, 255, 255, 100);
  background(255);
  smooth();
}

void draw() {
  fill(255, 255, 255, 20);
  rectMode(CORNER);
  rect(0, 0, 300, 300);
  
  x = x + speedX;
  y = y + speedY;

  if ( x > width-15 || x < 15) {
    speedX = speedX * -1;
  }
  if ( y > height-15 || y < 15) {
    speedY = speedY * -1 ;
  }

  noStroke();
  fill(186, 139, 185);
  ellipse(x, y, 30, 30);
}

/*void mousePressed(){
 saveFrame("thumbnail.png");
 }*/

