
ArrayList<Dot> dots;
ArrayList<Spider> spiders;
int step=10, num=1;

void setup() {
  size(600, 350);
  spiders = new ArrayList<Spider>();
  dots = new ArrayList<Dot>();
  for (int x=step/2; x<width; x+=step) {
    for (int y=step/2; y<height; y+= step) {
      dots.add(new Dot(x, y));
    }
  }
  for (int i=0; i<num; i++) {
    spiders.add(new Spider(random(100)));
  }
}

void draw() {
  background(255);
  for (Dot d : dots) {
    d.run();
  }
  for (Spider s : spiders) {
    s.run();
  }
  
  //if (frameCount%2==0 && frameCount<400) saveFrame("image-####.gif");  
}

class Dot {

  float x, y, ox, oy;
  float r = 1.0;

  Dot(float _ox, float _oy) {
    ox = _ox;
    oy = _oy;
  }

  void run() {
    update();
    display();
  }

  void update() {
    x = ox + random(-r, r);
    y = oy + random(-r, r);
  }

  void display() {
    stroke(0);
    point(x, y);
  }
}

class Spider {

  float nx, ny, x, y, r;
  int edge = 100, dirx=1, diry=1, n=7;

  Spider(float _r) {
    x = random(edge, width-edge);
    y = random(edge, height-edge);
    r = _r;
  }

  void run() {
    update();
    connectedLines();
  }

  void update() {
    nx = map(noise(r+frameCount/10), 0, 1, -n, n)*dirx;
    ny = map(noise(r+frameCount/20), 0, 1, -n, n)*diry;
    x += nx;
    y += ny;
    if (x>width || x<0) dirx *=-1;
    if (y>height || y<0) diry *=-1;
  }

  void connectedLines() {
    for (Dot d : dots) {
      float distance = dist(x, y, d.x, d.y);
      stroke(0,200);
      if (distance>step*3 && distance<step*9) line(x, y, d.x, d.y);
    }
  }
}


