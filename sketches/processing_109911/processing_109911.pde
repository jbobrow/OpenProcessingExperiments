
int x = 0;
int y = 0;
int speedX = 5;
int speedY = 3;

void setup() {
  size(600,600);
}

void draw() {
//background(0 );


  x = x + speedX;
  y = y + speedY;


  if ((x > width)) {
    speedX = speedX * -1;
    }
    if ((x < 0)){
     speedX = speedX * -1;
    }
    if ((y > height)) {
    speedY = speedY * -1;
    }
    if ((y < 0)){
    speedY = speedY * -1;
    }

  fill(0);
  noStroke();
  ellipse(x,y,6,6);
  fill(255);
  ellipse(y,x,6,6);
  }
