
class star { 
  int x, y, z; 
  color c; 
  float size;
  star() { // constructor
    x = (int)random(0, 1000);
    y = (int)random(0, 1000);
    z = (int)random(0, -10000);
    c = color(255); 
    size = random(1, 5);
  }
  void render() { 
    stroke(c); 
    strokeWeight(size); 
    point(x, y, z);
  }
  void move() {
    z += 1;
  }
}

star[] stars;
int MAX_STARS = 10000;
void setup() {
  size(600, 600, P3D);
  stars = new star[MAX_STARS]; 
  for (int i=0; i< MAX_STARS; ++i) {
    stars[i] = new star();
    frameRate(10000);
  }
}

int co = 255;
float angle = 0;

void draw() {
  background(0);

  pushMatrix();
  translate(width / 2, height / 2);
  co = 255;
  float rSub = map(mouseX, 0, random(200, width), 5, 20);
  float aAdd = map(mouseY, 0, random(200, height), PI / 2.0, PI / 48.0);
  cic(random(200, width) / 2, rSub, angle, aAdd);
  angle += PI / 23.0;
  popMatrix();

  for (int i=0; i< MAX_STARS; ++i) {
    stars[i].render();
    stars[i].move();
  }
}

void cic(float radius, float rSub, float angle, float aAdd) {
  pushMatrix();
  do {
    fill(co);
    co = 255 - co;
    ellipse(0, 0, radius * 2, radius * 2);
    radius -= rSub;
    angle += aAdd;
    float r = rSub * 0.6;
    float x = cos(angle + aAdd) * r;
    float y = sin(angle + aAdd) * r;
    translate(x, y);
  } 
  while (radius >= 1);
  popMatrix();
}

