

// Luca Sassone
// luglio 2010

float tt = 0;
float tt0 = 0;

cStar [] star = new cStar[20000];

// --------------------------------------------------------------

void setup() {
  size(640, 480, P3D);
  camera(0,45,-90,   0,-68,0,   0,-1,0);
  colorMode(HSB, 1);
  noFill();
  stroke(0, 0, 1);
  
  frameRate(30);
  
  for (int i=0; i<star.length; i++) {
    star[i] = new cStar();
  }
}

// --------------------------------------------------------------

void draw() {
  background(0, 0, 0);

  for (int i=0; i<star.length; i++) {
    star[i]._draw();
  }
}

// --------------------------------------------------------------

class cStar {
  PVector pt;
  float rad;
  float dir;
  float lum;
  
  cStar() {
    pt = new PVector(0, 0, 0);
    _init();
    rad = 10000 / random(1, 100);
  }
  
  void _init() {
    pt.set(0, 0, 0);
    rad = 120;
    dir = random(TWO_PI);
    lum = random(0.5, 1);
  }
  
  void _draw() {
    pt.x = rad * cos(dir);
    pt.y = -1000.0 / rad;
    pt.z = rad * sin(dir);
    
    stroke(0, 0, lum*(0.3*sin(-dir)+0.7));
    if (pt.y > -65-25*sin(dir)) point(pt.x, pt.y, pt.z);
    
    dir += 20 / (rad * rad);
    rad = 0.996*rad;
    
    if (pt.y < -90) _init();
  }
}


