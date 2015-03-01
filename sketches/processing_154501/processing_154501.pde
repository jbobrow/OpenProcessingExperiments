
float theta, sz, x, y, av, ds, maxsz, szdiff;
int num=20;

void setup() {
  size(500, 500);
  noFill();
  stroke(255);
  smooth(8);
  background(0);
  strokeWeight(2);
  x = width/2;
  y = height/2;
  av = 0.1;
  ds = 30;
  maxsz = 400;
  sz = 400;
  szdiff = 3;
}

void draw() {
  background(0);
  pushMatrix();
  translate(x, y);
  for (int i=0; i<num; i++) {
    rotate(theta);
    stroke(255);
    arc(0, 0, sz-i*ds, sz-i*ds, 0, PI);
  }
  popMatrix();
  theta += av;
  sz -= szdiff;
  szdiff = sz < 0.5 || sz > maxsz ? -szdiff : szdiff;
}
