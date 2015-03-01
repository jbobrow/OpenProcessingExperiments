
int c = 40;
int v = 40;
int x = 250;
float n = 1;
float a = 250;


void setup() {
  background(0);
  size(500, 500);
}

void draw() {


  if (mousePressed) {


    drawMonster();
  }
}

//right eye function
void rightEye() {
  while (c > 0) {


    fill (random(200));
    ellipse(300, 200, c, c);
    c = c - 10;
  }
  c = 40;
}

//left eye function
void leftEye() {
  while (v > 0) {


    fill (random(200));
    ellipse(200, 200, v, v);
    v = v - 10;
  }
  v=40;
}

void drawMonster() {
  n = random(200);

  bodyDraw();
    fill(random(200));


  rightEye();
    fill(random(200));


  leftEye();

  //mouth
  fill(random(200));
  ellipse(250, 300, 25, 50);
  ellipse(250, 300, 15, 40);
  ellipse(250, 300, 5, 30);
  ellipse(250, 300, 2, 20);
}

void bodyDraw() {
  while (x > 0) {

    fill (random(100));
    ellipse(250, 250, x, x);
    x = x - 10;
  }
  x=250;
}

