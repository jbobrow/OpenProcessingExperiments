
int numFrames = 62*3;

void setup() {
  size(400, 400);
  colorMode(HSB, 255);
  frameRate(60);
  background(51);
}

void draw() {
  sample();
}

float a, s, c, f1, f2;
float sw = 48, sh = 48;
float w, h;
float x, y;

void sample() {  
  noStroke();
  fill(51, 21);
  rect(0, 0, width, height);

  a = map((frameCount-1)%(numFrames), 0, (numFrames)-1, 0, TWO_PI);
  s = sin(a);
  c = cos(a);

  y = height/2;
  x = width/2;
  w = 160 + 20*s;
  h = 160 + 20*s;

  f1 = map(c, -1, 1, 255*0.5, 255*0.7);
  f2 = map(s, -1, 1, 255*0, 255*0.2);

  pushMatrix();

  translate(x, y);
  rotate(a);

  fill(f1, 255, 204);
  pushMatrix();
  translate(-(w/2)+sw/2, -(h/2)+sh/2);
  rotate(-a);
  rect(-sw/2, -sh/2, sw, sh);
  popMatrix();

  fill(f2, 255, 204);
  pushMatrix();
  translate(w/2-sw+sw/2, -(h/2)+sh/2);
  rotate(a);
  rect(-sw/2, -sh/2, sw, sh);
  popMatrix();

  fill(f2, 234, 204);
  pushMatrix();
  translate(-(w/2)+sw/2, h/2-sh+sh/2);
  rotate(a);
  rect(-sw/2, -sh/2, sw, sh);
  popMatrix();

  fill(f1, 234, 204);
  pushMatrix();
  translate(w/2-sw+sw/2, h/2-sh+sh/2);
  rotate(-a);
  rect(-sw/2, -sh/2, sw, sh);
  popMatrix();

  popMatrix();
}

