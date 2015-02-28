
PImage flan, wing;

int[] r_y = {
  5, 45, 65, 65, 60, 45, 30
};
float theta;

void setup() {
  size(440, 300);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();

  flan = loadImage("flan.png");
  wing = loadImage("flan_wing.png");

  rectMode(CENTER);
}

void draw() {
  background(0);

  flan_wing(5, 80);

  theta  += 0.01;
}

void flan_wing(int x, int y) {
  pushMatrix();
  translate(x, y);

  rotate(sin(-theta)/10);
  image(wing, 0, 0);

  for (int i = 0;i<7;i++) {
    pushMatrix();
    translate(40+60*i, y-r_y[i]);
    rotate(sin(-theta) / 2);
    image(flan, 0, 0);
    popMatrix();
  }

  popMatrix();
}

