
void setup() {
  size(640, 480);
  background(255);
}

void draw() {  
  base(int(random(width)),int(random(height)));
}

void mousePressed() {
  frameCount = 0;
  background(255);
}

void base(int x, int y) {
  //Pick a random base color
  int a = int(random(255));
  int b = int(random(255));
  int c = int(random(255));
  color base = color(a, b, c);
  int r = 10 + int(random(30));
  fill(base);
  ellipse(x, y, r, r);
  noFill();
  
  //Create 5-20 petals from the base
  int numPetals = 5+int(random(15));
  int rbg = int(random(2));
  for(int index = 0; index < numPetals; index++)
  {
    fill(shade(base, rbg));
    petal(x, y, r, base);
    noFill();
  }
}

void petal(int x, int y, int r, color base) {
  pushMatrix();
  int rotation = int(random(360));
  translate(x, y);
  rotate(radians(rotation));
  beginShape();
  vertex(0, -r);
  bezierVertex(-15, -15, -30, -30, 15-random(30), -random(30));
  bezierVertex( 15, -15, 15, -30, 0, -r);
  endShape();
  popMatrix();
}

color shade(color base, int rbg) {
  int seed = int(100-random(200));
  int r = int(red(base));
  int b = int(blue(base));
  int g = int(green(base));
  if(rbg == 0) {
    if(r+seed > 255 || r+seed < 0)
      seed = -seed;
    return color(r+seed, b, g);
  }
  if(rbg == 1) {
    if(g+seed > 255 || g+seed < 0)
      seed = -seed;
    return color(r, b+seed, g);
  }
  if(rbg == 2) {
    if(b+seed > 255 || b < 0)
      seed = -seed;
    return color(r, b, g+seed);
  }

  return color(0,0,0);
}
