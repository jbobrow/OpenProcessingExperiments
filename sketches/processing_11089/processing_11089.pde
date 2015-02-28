

// Luca Sassone
// luglio 2010

cCerchio [] cerchio = new cCerchio[50];

// -----------------------------------------------------------------------------------------------------

void setup() {
  size(800, 600, P2D);
  colorMode(RGB, 1);
  noFill();
  stroke(1);
  ellipseMode(CENTER);
  frameRate(30);
  
  for (int i=0; i<cerchio.length; i++) {
    cerchio[i] = new cCerchio();
    cerchio[i]._init();
    for (int j=0; j<i*4; j++) {
      cerchio[i]._tick();
    }
  }
}

// -----------------------------------------------------------------------------------------------------

void draw() {
  background(0, 0, 0);
  for (int i=0; i<cerchio.length; i++) {
    cerchio[i]._draw();
  }
}

// -----------------------------------------------------------------------------------------------------

class cCerchio {
  float px;
  float py;
  float rad;

  void _init() {
    px = random(width);
    py = random(height);
    rad = 1;
  }

  void _tick() {
    rad += 10;
    if (rad > width+height) _init();
  }  
  
  void _draw() {
    stroke(100/rad);
    ellipse(px, py, rad, rad);
    _tick();
  }
}

// -----------------------------------------------------------------------------------------------------


