
int x;
int y;
int directionx;
int directiony;

void setup() {
  size(600, 600);
  smooth();
  x = 300;
  y = 250;
  directionx = 8;
  directiony = 8;
}


void draw() {

  background(255);
  noStroke();

  fill(255, 255, 0, 30);

  ellipse(x, y, 50, 50);
  ellipse(x, y, 100, 100);
  ellipse(x, y, 150, 150);
  ellipse(x, y, 200, 200);
  ellipse(x, y, 250, 250);
  ellipse(x, y, 300, 300);
  ellipse(x, y, 350, 350);
  ellipse(x, y, 400, 400);
  ellipse(x, y, 450, 450);
  ellipse(x, y, 500, 500);
  ellipse(x, y, 550, 550);
  ellipse(x, y, 600, 600);
  ellipse(x, y, 650, 650);
  ellipse(x, y, 700, 700);
  ellipse(x, y, 750, 750);

  fill(255, 0, 0, 25);
  ellipse(x, 300, 50, 50);
  ellipse(x, 300, 100, 100);
  ellipse(x, 300, 150, 150);
  ellipse(x, 300, 200, 200);
  ellipse(x, 300, 250, 250);
  ellipse(x, 300, 300, 300);
  ellipse(x, 300, 350, 350);
  ellipse(x, 300, 400, 400);
  ellipse(x, 300, 450, 450);
  ellipse(x, 300, 500, 500);
  ellipse(x, 300, 550, 550);
  ellipse(x, 300, 600, 600);
  ellipse(x, 300, 650, 650);
  ellipse(x, 300, 700, 700);
  ellipse(x, 300, 750, 750);

  fill(0, 0, 255, 25);
  ellipse(300, y, 50, 50);
  ellipse(300, y, 100, 100);
  ellipse(300, y, 150, 150);
  ellipse(300, y, 200, 200);
  ellipse(300, y, 250, 250);
  ellipse(300, y, 300, 300);
  ellipse(300, y, 350, 350);
  ellipse(300, y, 400, 400);
  ellipse(300, y, 450, 450);
  ellipse(300, y, 500, 500);
  ellipse(300, y, 550, 550);
  ellipse(300, y, 600, 600);
  ellipse(300, y, 650, 650);
  ellipse(300, y, 700, 700);
  ellipse(300, y, 750, 750);

  x += directionx;
  y += directiony;

  if (y > 600) {
    directiony = -2;
  }

  if (x > 600) {
    directionx = -2;
  }

  if (y < 0) {
    directiony = 8;
  }

  if (x < 0) {
    directionx = 8;
  }
}


