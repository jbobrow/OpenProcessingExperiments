
class star {
  float x, y;
  int z, r, theta;
  color c;
  float size;
  star() { // constructor
    init(true);
  }
  void init(boolean isFirst) {
    if (isFirst) {
      r = (int)random(0, width);
    } else
    {
      r = (int)random(width*0.75, width);
    }
    theta = (int) random(0, 360);
    calculate();
    z = (int)random(0, -10);
    colorMode(HSB,360,100,100);
    size = random(1, 3);
    c = color(map(r,width,0,180,250), 100, 100);
    
  }
  

  void render() {
    stroke(c);
    strokeWeight(size);
    point(x, y, z);
  }

  void move() {
    if (r < 0) {
      init(false);
    } else {
      theta++;
      r-= map(r, width,0, 1,10);
      calculate();
      c = color(map(r,width,0,180,250), 100, 100);
    
    }
  }

  void calculate() {
    x = r*cos(radians(theta));
    y = r*sin(radians(theta));
  }
}
class darkmatter {
  float x, y;
  int z, r, theta;
  float size;
  darkmatter() { // constructor
    init(true);
  }
  void init(boolean isFirst) {
    if (isFirst) {
      r = (int)random(0, width);
    } else
    {
      r = (int)random(width*0.75, width);
    }
    theta = (int) random(0, 360);
    calculate();
    z = (int)random(0, -10);
    size = random(1, 3);
  }
  

  void render() {
    stroke(0);
    int sz = (int) map(r, width, 0, 1, 40);
    strokeWeight(sz);
    point(x, y, z);
  }

  void move() {
    if (r == 0) {
      init(false);
    } else {
      theta++;
      r--;
      calculate();
    }
  }

  void calculate() {
    x = r*cos(radians(theta));
    y = r*sin(radians(theta));
  }
}
star[] stars;
darkmatter[] dms;
int MAX_STARS = 5000;
int MAX_DARKMATTERS = 5000;
void setup() {
  size(600, 600, P3D);
  stars = new star[MAX_STARS];
  for (int i=0; i< MAX_STARS; ++i) {
    stars[i] = new star();
  }
  dms = new darkmatter[MAX_DARKMATTERS];
  for (int i=0; i< MAX_DARKMATTERS; ++i) {
    dms[i] = new darkmatter();
  }
}
void draw() {
  translate(width/2, height/2);
  rotateX(radians(230));
  background(0);
  for (int i=0; i< MAX_STARS; ++i) {
    stars[i].render();
    stars[i].move();
  }
  for (int i=0; i< MAX_DARKMATTERS; ++i) {
    dms[i].render();
    dms[i].move();
  }
}

