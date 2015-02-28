
PShape b;
float angle;
PShape t;
PImage i;

void setup() {
  size(400, 400);
  smooth();
  b = loadShape("logo.svg");
  t = loadShape("type.svg");
  i = loadImage("cloud.jpg");
  frameRate(60);
}

void draw() {

  angle += 0.05;

  image(i, 0, 0);

  if (mousePressed && mouseButton == LEFT) {
    translate(mouseX-200, mouseY-170);
  }

  pushMatrix();
  translate(width/2, 300);
  shape (t, -100, -10, 200, 30);
  popMatrix();

  float theta = 3+ (8.0*sin(angle));

  translate(0, theta);

  pushMatrix();
  translate(width/2, 170);
  shape (b, -100, -100, 200, 200);
  popMatrix();
}


