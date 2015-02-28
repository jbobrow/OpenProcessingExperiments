
/*
float D = 2.75/4; //factor for d
float T = 2.50/4; //factor for t

void setup() {
  size(500,500);
  smooth();
  strokeCap(ROUND);
  noLoop();
}

void draw() {
  background(255);
  float x = 250;
  float y = 450;
  float a0 = -PI/2; //direction of axis (of the tree (or, when in a recursive loop: branch))
  float a = PI/3; //angle subtended by all (n) branches
  int n = 3; //number of branches
  float d = 100; //length
  float t = 5; //thickness
  int level = 6;
  if(level>0) tree(x, y, a0, a, n, d, t, level-1);
}

void tree(float x, float y, float a0, float a, int n, float d, float t, int level) {
  pushMatrix();
  translate(x, y);
  rotate(a0);
  for(int i=0; i<n; i++) {
    strokeWeight(t);
    stroke(0);
    a0 = (a/2) - (i*a/(n-1));
    x = d * cos(a0); 
    y = d * sin(a0);
    line(0, 0, x, y);
    if(level>0) tree(x, y, a0, a, n, d*D, t*T, level-1);
  }
  popMatrix();
}
*/

