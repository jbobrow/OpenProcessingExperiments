
float D = 2.75/4; //factor for d
float T = 2.50/4; //factor for t
float A = PI/random(6,16);

void setup() {
  size(500,500);
  smooth();
  strokeCap(ROUND);
  noLoop();
  println(PI/A);
}

void draw() {
  background(255);
  float x = 250;
  float y = 450;
  float a = -PI/2; //starting angle
  float d = 100; //length
  float t = 7.5; //tickness
  int level = 8;
  tree(x, y, a, d, t, level);
}

void tree(float x, float y, float a, float d, float t, int level) {
  level--;
  pushMatrix();
  translate(x, y);
  rotate(a);
  x = d*cos(A);
  y = d*sin(A);
  strokeWeight(t);
    line(0, 0, d, 0);
      if (level>0) tree(d, 0, 0, d*D, t*T, level);
  strokeWeight(t);
    line(0, 0, x, y);
        if (level>0) tree(x, y, A, d*D, t*T, level);
  strokeWeight(t);
    line(0, 0, x, -y);
      if (level>0) tree(x, -y, -A, d*D, t*T, level);
  popMatrix();
}


