
float angle;
float dim = 100;
float num;
color[] c;

void setup() {
  size(800, 200, P3D);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  rectMode(CENTER);

  num = width/dim;
  c = new color[(int)num];
  float colorSeed = 360/num;
  for (int i=0; i<num; i++) {
    c[i] = color(colorSeed*i, 30, 100);
  }
  angle = 0.0f;
}

void draw() {
  translate(dim/2, height/2);
  background(0, 0, 100);
  for (int i=0; i<num; i++) {
    pushMatrix();
    translate(i*dim, 0);
    rotateY(radians(angle));
    fill(c[i]);
    rect(0, 0, dim, height);
    popMatrix();
  }
  angle++;
}



