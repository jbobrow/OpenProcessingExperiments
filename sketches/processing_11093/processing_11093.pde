

// Luca Sassone
// luglio 2010

int nr_an = 30*2;
cAnello [] anello = new cAnello[nr_an];

int w2, h2;

// ---------------------------------------------------------------

void setup() {
  size (900, 300, P2D);
  frameRate(60);
  ellipseMode(CENTER);
  colorMode(HSB, 1);
  noFill();
  for (int i=0; i<nr_an; i++) {
    anello[i] = new cAnello();
    anello[i].rad = random(1, 100);
  }
  w2 = width / 2;
  h2 = height / 2;
}

// ---------------------------------------------------------------

void draw () {
  background(0.6, 0.3, 1);
  
  stroke(0.5, 0.3, 0.7);
  int ix = -400;
  int fx =  800;
  int iy = -400;
  int fy =  800;
  float v1 = 0.500;
  float v2 = 0.866;
  for (int i=iy; i<fy; i+=50) {
    float ppx1 = proiettaX(v2*ix - v1*i, v1*ix + v2*i);
    float ppy1 = proiettaY(v2*ix - v1*i, v1*ix + v2*i);
    float ppx2 = proiettaX(v2*fx - v1*i, v1*fx + v2*i);
    float ppy2 = proiettaY(v2*fx - v1*i, v1*fx + v2*i);
    line(w2+ppx1, h2-ppy1, w2+ppx2, h2-ppy2);
  }
  
  for (int i=ix; i<fx; i+=50) {
    float ppx1 = proiettaX(v2*i - v1*iy, v1*i + v2*iy);
    float ppy1 = proiettaY(v2*i - v1*iy, v1*i + v2*iy);
    float ppx2 = proiettaX(v2*i - v1*fy, v1*i + v2*fy);
    float ppy2 = proiettaY(v2*i - v1*fy, v1*i + v2*fy);
    line(w2+ppx1, h2-ppy1, w2+ppx2, h2-ppy2);
  }

  for (int i=0; i<nr_an; i++) {
    anello[i].draw();
  }
//  noLoop();
}

// ---------------------------------------------------------------

class cAnello {
  float ppx;
  float ppy;
  float rad;  
  float rx;
  float ry;
  
  cAnello() {
    init();
  }
  
  void init () {
    float px = random(-500, 500);    
    float py = random(-200, 400);
    ppx = proiettaX(px, py);
    ppy = proiettaY(px, py);
    rad = 1;
    rx = proiettaX(px+1, py) - ppx;
    ry = proiettaY(px, py+1) - ppy;
    stroke(0.6, 0.3, 0.2);
    line(w2 + ppx - (h2 - ppy)/2, 0, w2 + ppx, h2 - ppy);
  }
  
  void draw () {
    float v = rad / 100.0;
    stroke(0.6, 0.3, v);
    ellipse(w2 + ppx, h2 - ppy, rx*rad, ry*rad);    
    if(rad > 5) {
      stroke(0.6, 0.3*(0.7*v + 0.3), 1);
      ellipse(w2 + ppx, h2 - ppy, rx*(rad-5), ry*(rad-5));
    }
    if(rad > 10) {
      stroke(0.6, 0.3, 0.7*v + 0.3);
      ellipse(w2 + ppx, h2 - ppy, rx*(rad-10), ry*(rad-10));
    }
    if(rad > 15) {
      stroke(0.6, 0.3*(0.4*v+0.6), 1);
      ellipse(w2 + ppx, h2 - ppy, rx*(rad-15), ry*(rad-15));
    }
    if(rad > 20) {
      stroke(0.6, 0.3, 0.4*v + 0.6);
      ellipse(w2 + ppx, h2 - ppy, rx*(rad-20), ry*(rad-20));
    }
    
    rad += 2;
    if (rad > 100) {
       init();
    }
  }
}

// ---------------------------------------------------------------


float proiettaX(float px, float py) {
  float ppx = px * width / (py + width);
  return ppx;
}

// ---------------------------------------------------------------

float proiettaY(float px, float py) {
  float ppy = py * 1.5*height / (py + width);
  return ppy;
}

