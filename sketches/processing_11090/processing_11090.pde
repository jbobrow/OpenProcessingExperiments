

// Luca Sassone
// luglio 2010

int nr_stringhe = 30;
cStringa [] stringa = new cStringa[nr_stringhe];

float alfa = 0;

boolean mouse = false;
int mo = 0;

// ----------------------------------------------------------

void setup () {
  size (800, 600, P2D);
  frameRate(30);
  colorMode(HSB, 1);
  ellipseMode(CENTER);
  noFill();
  
  for (int i=0; i<nr_stringhe; i++) {
    stringa[i] = new cStringa(TWO_PI * i / nr_stringhe);
  }
  background(0);
}

// ----------------------------------------------------------

void draw () {
  
  background(0);
  for (int i=0; i<nr_stringhe; i++) {
    stringa[i]._step();
    stringa[i]._draw();
  }
  alfa += 0.1;
  
  if (mouse) {
    mo++;
    if (mo > 200) {
      mo = 0;
      mouse = false;
      noCursor();
    }
  }
}

// ----------------------------------------------------------

void mouseMoved() {
  mouse = true;
  cursor(ARROW);
}

// ----------------------------------------------------------

class cStringa {
  int nr_data = 100;
  PVector [] data = new PVector[nr_data];
  
  float dir;
  
  cStringa (float d_) {
    dir = d_;
    for (int i=0; i<nr_data; i++) {
      data[i] = new PVector(width/2+i, height/2);
    }
  }
  
  void _step() {
    int w2 = width / 2;
    int h2 = height / 2;
    float alfa0 = alfa * 0.2;
    int mx = w2 + int(w2*0.7*(sin(alfa0*PI)*cos(alfa0+sin(alfa0)) + cos(alfa0*PI)*cos(alfa0/PI)));
    int my = h2 + int(h2*0.7*(sin(alfa0*PI)*sin(alfa0+cos(alfa0)) + cos(alfa0*PI)*sin(alfa0/PI)));
    if (mouse) {
      data[0].x += 0.2 * (mouseX - data[0].x);
      data[0].y += 0.2 * (mouseY - data[0].y);
    }
    else {
      data[0].x += 0.2 * (mx - data[0].x);
      data[0].y += 0.2 * (my - data[0].y);
    }
    for (int i=1; i<nr_data; i++) {
      float f = (1.0-(float)i/(float)nr_data);
      data[i].x += f*cos(dir);
      data[i].y += f*sin(dir) + 0.4*sin(0.5*alfa + 0.05*data[i].x);
      float d = 2.0 / dist(data[i-1].x, data[i-1].y, data[i].x, data[i].y) - 1.0;
      float deltax = data[i].x - data[i-1].x;
      float deltay = data[i].y - data[i-1].y;
      float dx = 0.5 * d * deltax;
      float dy = 0.5 * d * deltay;
      data[i].x += dx;
      data[i].y += dy;
    }
  }
  
  void _draw() {
    for (int i=1; i<nr_data; i++) {
      int px1 = (int)(data[i-1].x);
      int py1 = (int)(data[i-1].y);
      int px2 = (int)(data[i].x);
      int py2 = (int)(data[i].y);
      stroke(0.7, (float)i/(float)nr_data, 1, 0.7);
      line(px1, py1, px2, py2);
    }
  }
}



