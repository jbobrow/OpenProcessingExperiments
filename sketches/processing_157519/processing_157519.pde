
int num=7, sw=20;
float r;
long rs;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  noFill();
  rs = (long) random(100);
  strokeWeight(sw);
  strokeCap(SQUARE);
}

void draw() {
  randomSeed(rs);
  background(#000000);
  for (int i=0; i<3; i++) {
    arcs(width/2, height/2);
  }
  //if (frameCount%2==0 && frameCount<241) saveFrame("image-###.gif");
}

void arcs(float x, float y) {
  pushMatrix();
  translate(x, y);
  rotate(r);
  for (int i=0; i<num; i++) {
    stroke(360.0/num*i, 100, 100, 140);
    float start = random(TWO_PI);
    float end = start + random(PI/5, PI/3);
    float scal = map(sin(r+TWO_PI/num*i), -1, 1, .5, 2);
    arc(0, 0, width*.9-i*3*sw, height*.9-i*3*sw, start, end*scal);
  }
  r += .0523/2;
  popMatrix();
}
