
int num=10, sw=8, fc;
float r;
long rs;
boolean save = false;

void setup() {
  size(500, 500);
  //colorMode(HSB, 360, 100, 100);
  noFill();
  rs = (long) random(100);
  strokeWeight(sw);
  strokeCap(SQUARE);
}

void draw() {
  randomSeed(rs);
  background(#14133B);
  for (int i=0; i<3; i++) {
    arcs(width/2, height/2);
  }
  if (save) {
    if (frameCount%2==0 && frameCount<fc+241) saveFrame("image-###.gif");
  }
}

void arcs(float x, float y) {
  pushMatrix();
  translate(x, y);
  rotate(r);
  for (int i=0; i<num; i++) {
    //stroke(360.0/num*i, 100, 100, 120);
    float lerpAmount = 1.0/num*i;
    color col = lerpColor(#9E023B, #FFC675, lerpAmount);
    stroke(col, 220);
    float start = random(TWO_PI);
    float end = start + random(PI/5, PI/3);
    float scal = map(sin(r+TWO_PI/num*i), -1, 1, .5, 1.5);
    arc(0, 0, width*.7-i*4*sw, height*.7-i*4*sw, start, end*scal);
  }
  r += .0523/2;
  popMatrix();
}

void keyPressed() {
  save = true;
  fc = frameCount;
}

