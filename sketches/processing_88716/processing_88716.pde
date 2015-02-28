
PShape teapot, head, rim, bowl, grip;
PShape stem, curveB, curveT, top, bottom;
PShape handle, handleO, handleI;
int x = 0;
int y = 0;
int rimW = 50;
int rimH = 50;
int bowlW = 50;
int bowlH = 50;
int gripW = 10;
int gripH = 10;
int arcW = 20;
int arcH = 20;
int topW = 5;
int handleW = 30;
float gripA = PI;
float spoutOff = 0;
int red = 255;
int green = 255;
int blue = 255;

void setup() {
  size(1000, 1000, P2D);
  background(250);
  drawTeapot();
  ellipseMode(CENTER);
}

void createTeapot() {
  setCharacteristics();
  fill(red, green, blue);
  ellipse( x, y, bowlW, bowlH);
  ellipse(x, y - bowlH/2, bowlW, rimH);
  arc(x, y - bowlH/2, gripW, gripH, PI, (QUARTER_PI * int(random(8, 9))));
  arc(x + bowlW/4, y, handleW, handleW, 3*HALF_PI, 5*HALF_PI);
  arc(x + bowlW/4, y, handleW - 10, handleW - 10, 3*HALF_PI, 5*HALF_PI);
  noFill();
  ellipseMode(CORNER);
  spoutOff = bowlH/4;
  arc(x - 3*bowlW/7, y - spoutOff, arcW, arcH, HALF_PI, PI);
  arc(x - 3*bowlW/7 + topW, y - spoutOff - 5, arcW, arcH - 4, HALF_PI, PI);
  fill(255);
  line(x - 3*bowlW/7, y - spoutOff + arcH/2, x - 3*bowlW/7 + topW, y - spoutOff + arcH/2 - 5);
  ellipseMode(CENTER);
}

void setCharacteristics() {
  rimW = int(random(40, 50));
  rimH = int(random(5, 20));
  bowlW = int(random(30, 85));
  bowlH = int(random(40, 70));
  gripW = int(random(5, 10));
  gripH = int(random(5, 20));
  arcW = int(random(10, 25));
  arcH = int(random(10, 30));
  topW = int(random(2, 4));
  handleW = int(random(15,bowlH/2));
  red = int(random(75,241));
  green = int(random(158, 252));
  blue = int(random(190,252));
  //gripA = QUARTER_PI * int(random(0,5));
}

void drawTeapot() {
  for (int i = 50; i < width; i += 100) {
    x = i;
    for (int j = 50; j < height; j += 100) {
      y = j;
      createTeapot();
    }
  }
}



