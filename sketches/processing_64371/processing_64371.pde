
/*Bouncing Ball mit einem definiertem Abstand zum Fensterrahmen.*/

float x = 70;
float y = 70;
float speedX = 2;
float speedY = 10;

void setup() {
  size(300, 300);
  colorMode(RGB, 255, 255, 255, 100);
  background(255);
  smooth();
}

void draw() {
  fill(60, 60, 60, 20);
  rectMode(CENTER);
  rect(150, 150, 230, 230);

  x = x + speedX;
  y = y + speedY;

  if ( x > width-55 || x < 55) {
    speedX = speedX * -1;
  }
  if ( y > height-55 || y < 55) {
    speedY = speedY * -1 ;
  }

  noStroke();
  fill(186, 139, 185);
  ellipse(x, y, 30, 30);
}

/*void mousePressed(){
 saveFrame("thumbnail.png");
 }*/

