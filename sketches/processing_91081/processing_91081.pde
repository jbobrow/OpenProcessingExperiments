
//AdrianneBorn
//Ben Norskov
//Feb 25 2013
//Week 4 HW

float x;
float y;
float speedX;
float speedY;
void setup() {
  size(500, 500);
  frameRate(15);
  smooth();
  background(39,229,136);
  x = width/2;
  y = height/2;
  speedX = 8;
  speedY = 3;
}

void draw() {

  fill (random(255), random(255), random(255));
  stroke(255);
  ellipse(x, y, x + 1, x+ 2);
  ellipse(y, x, y + 2, y+ 1);

  x = x + speedX;
  y = y + speedY;



  if (x > width || x < 0) {
    speedX *= - 1;
  }

  if (y > height || y < 0) {
    speedY *= - 1;
  }
}



