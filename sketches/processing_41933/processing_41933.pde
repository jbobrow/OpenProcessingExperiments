
int x, y;
int vX, vY;
int a, b, vA, vB;
int c1, c2, c3;

void setup() {
  size(600, 600);
  smooth();
  x = 150;
  y = 200;
  vX = 10;
  vY = 15;
  a = 40;
  b = 85;
  vA = 15;
  vB = 10;
  c1 = 255;
  c2 = 255;
  c3 = 255;
  textSize(20);
  textAlign(CENTER);
}
void draw() {
  background(255);
  fill(c1, c2, c3);
  for (int i=0; i < 100; i++) {
    for (int j=0; j < 100; j++) {
      rect(7*i, 7*j, 5, 5);
    }
  }
  x+=vX;
  y+=vY;
  fill(0, 0, 255);
  ellipse (x, y, 50, 50);
  a+=vA;
  b+=vB;
  fill(255, 0, 0);
  ellipse (a, b, 20, 20);
  //noFill();
  if ( x > width - 25 || x < 25) {
    vX *=-1;
    c3 = c3 + 120;
    c1 = c1 + 110;
    c2 = c2 + 100;
  }
  if ( y > height - 25 || y < 25) {
    vY *=-1;
    c3 = c3 / 2;
    c1 = c1 / 2;
    c2 = c2 / 2;
  }

  if ( a > width - 10 || a < 10) {
    vA *=-1;
    c3 = c3 + 100;
    c1 = c1 + 75;
    c2 = c2 + 50;
  }
  if ( b > height - 10 || b < 10) {
    vB *=-1;
    c3 = int(random(255));
    c1 = int(random(255));
    c2 = int(random(255));
  }
  if (c3 < 50) {
    fill(255);
    text("(hello)", 300, 300);
  }
}


