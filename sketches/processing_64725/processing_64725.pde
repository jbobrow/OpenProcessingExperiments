
PImage plane;
PImage[] cloud = new PImage[5];

float x;
float y;

int N = 150;

float c_x = -100;
float c_y = 200;
int c_r = (int)random(4);

void setup() {
  size(300, 250);
  background(106, 216, 255);

  smooth();

  plane = loadImage("plane01.png");
  for (int i = 0;i < 5;i++) {
    cloud[i] = loadImage("cloud" + i + ".png");
  }
  imageMode(CENTER);
}


void draw() {
  background(106, 216, 255);

  float p_y = random(-1, 1);

  x = width/2;
  y = height/2;

  pushMatrix();
  translate(x, y+p_y);
  noStroke();
  fill(255, 150);
  for (int i = 0; i < N;i++) {
    ellipse(i, random(-10, 10)+p_y, 15, 15);
  }
  image(plane, 0, 0);
  popMatrix();

  pushMatrix();
  translate(0, 0);
  image(cloud[c_r], c_x, c_y);
  c_x+=3;

  if (c_x > width + 80) {
    c_y = random(height);
    c_x = -100;
    c_r = (int)random(4);
  }
  popMatrix();
}

