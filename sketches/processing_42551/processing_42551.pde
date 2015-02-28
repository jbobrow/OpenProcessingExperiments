
int x=0;
int y= 150;
int a=width;
int b=250;
 
int speedX = 3;
int speedY = 10;
 
void setup() {
  size(400, 400);
  smooth();
  fill(105, 219, 145);
  rect(0, 0, width, height);
}
 
void draw() {
  noStroke();
  fill(10);
  rect(0, 0, width, height);
 
  fill(255, 10, 210);
  noStroke();
 
 
  if (mousePressed) {
    if (y < 100 || y > 180) {
      if (b < 220 || b > 300) {
        speedY = speedY * +2;
      }
    }
 
    if (x > width || x < 0) {
      x=0;
    }
    else if (a > width || a < 0) {
      a=width;
    }
    ellipse(x, y, 20, 20);
    ellipse(a, b, 20, 20);
 
    speedX = 1;
    x = x + speedX;
    y = y + speedY;
    a = a - speedX;
    b = b - speedY;
  }
 
  else {
    if (x > width || x < 0) {
      x=0;
    }
    else if (a > width || a < 0) {
      a=width;
    }
    fill(255,249,100);
    ellipse(x, y, 40, 40);
    ellipse(a, b, 40, 40);
 
    x = x + speedX;
    a = a - speedX;
    speedX= 5;
    y=150;
    b=250;
  }
}


