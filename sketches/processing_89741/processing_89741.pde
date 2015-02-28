
PImage k;
PImage i;
PImage z;
PImage g;
PImage e;


float angle;
float rad = 90;
float cx, cy;
float a=0;
float b=0;

void setup() {

  size (500, 500);
  k = loadImage ("target.png");
  i = loadImage ("lips.png");
  z = loadImage ("lips.png");
  g = loadImage ("lips.png");
  e = loadImage ("lips.png");


  imageMode(CENTER);
  frameRate(60);
  cx = width/5;
  cy= height/5;
}

void draw() {
  float angle = frameCount/30.0;

  float x =cx + cos(angle)*rad;
  float y =cy + sin(angle)*rad;

  angle = radians(55);
  background(0);

  pushMatrix();
  translate(0, 0);
  rotate(frameCount/50.0);
  image(k, x, y, 1000, 1000);
  popMatrix();

  pushMatrix();
  translate(10, 20);
  image(z, x, y, 300, 300);
  popMatrix();

  pushMatrix();
  translate(100, 500);
  popMatrix();

  pushMatrix();
  translate(10, 100);
  image(i, x+50, sin(y), 100, 100);
  popMatrix();

  pushMatrix();
  translate(200, 20);
  rotate(frameCount/90.0);
  image(g, x, y, 200, 200);
  popMatrix();

  pushMatrix();
  translate(120, 470);
  image(e, x, y, 200, 200);
  popMatrix();








}



