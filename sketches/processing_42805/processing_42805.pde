
int x = 50;
int y = 150;
int speedx = 1;
int speedy = 2;

int x2 = 50;
int y2 = 50;
int speedx2 = 1;

void setup() {

  size(400, 200);
  background(255);
  smooth();
  noStroke();
  fill(0, 10);
  /*
  for (int i = 0; i < 400; i = i + 100) {
   rect(i, 0, 200, 200);
   }
   line(0, height/2, 1200, height/2);
   */
}

void draw() {

  x = x + speedx;
  y = y - speedy;
  x2 = x2 + speedx2;
  y2 = y2 + speedx2;

  pushMatrix();

  translate(0, 0);

  if (x2 == 150 || x2 == 50) {

    speedx2 = -speedx2;
  }

  ellipse(100, y2, 20, 20);
  ellipse(x2, 50, 20, 20);

  popMatrix();


  pushMatrix();

  translate(200, 0);

  if (x == 100) {

    speedy = -speedy;
  }

  if (x == 150 || x == 50) {

  speedy = -speedy;
  speedx = -speedx;
  }

  ellipse(x, y, 20, 20);

  popMatrix();
}


