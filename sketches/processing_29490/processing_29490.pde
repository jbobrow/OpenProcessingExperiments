

int time = 0;
cGetto [] getto = new cGetto[2];
int maxeta = 400;
PImage tex;

// --------------------------------------------------------------

void setup() {
  size(700, 500, P3D);
  ellipseMode(CENTER);
  colorMode(HSB, 255);
  noStroke();
  
  getto[0] = new cGetto(      10, int(0.9 * height),   -1,       0);  
  getto[1] = new cGetto(width-10, int(0.9 * height), PI+1, HALF_PI);

  textureMode(NORMALIZED);
  
  tex = createImage(64, 64, ALPHA);
  tex.loadPixels();
  for (int y=0; y<tex.height; y++) {
    for (int x=0; x<tex.width; x++) {
      float v1 = map(x, 0, tex.width, -1, 1);
      float v2 = map(y, 0, tex.height, -1, 1);
      float v3 = 1.0 - sqrt(v1 * v1 + v2 * v2);
      tex.pixels[y*tex.width+x] = color(0, 0, v3 * 100);
    }
  }
  tex.updatePixels();
  
}

// --------------------------------------------------------------

void draw() {
  background(0, 0, 0);
  for (int i=0; i<getto.length; i++) {
    getto[i]._draw();
  }
  time++;
  if ((time % 300) == 0) {
    for (int i=0; i<getto.length; i++) {
      getto[i].hu = random(255);
    }
  }
}

// --------------------------------------------------------------

class cGetto {
  PVector pt;
  PVector v;
  cGoccia [] goccia = new cGoccia[500];
  float alfa0;
  float alfa;
  float d;
  float hu;
  
  cGetto(int x, int y, float a0, float d_) {
    pt = new PVector(x, y);    
    v = new PVector();    
    hu = random(255);
    for (int i=0; i<goccia.length; i++) {
      goccia[i] = new cGoccia(hu);
      _initGoccia(i);
      goccia[i].eta = maxeta + i;    
    }
    alfa0 = a0;
    d = d_;
  }
  
  void _setvel() {
    alfa = alfa0 + 0.5 * sin(0.05 * time + d);
    // velocità delle gocce
    v.x = 9 * cos(alfa);
    v.y = 9 * sin(alfa);
  }
  
  void _draw() {    
    _setvel();
    for (int i=0; i<goccia.length; i++) {
      if (goccia[i].eta <= maxeta) {
        goccia[i]._draw();
        if (goccia[i].eta == 0) _initGoccia(i);
      }
      else {
        goccia[i].eta--;
        goccia[i].setvel(v);
      }
    }
  }
  
  void _initGoccia(int i) {
    goccia[i].pt = pt.get();
    goccia[i].pt.x += random(-10, 10);
    goccia[i].pt.y += random(-10, 10);
    goccia[i].setvel(v);
    goccia[i].eta = maxeta;
    goccia[i].hu = hu + random(-30, 30);
  }
}

// --------------------------------------------------------------

class cGoccia {
  PVector pt;
  PVector v;
  int eta;
  int rad;
  float hu;
  float sa;
  float br;
  boolean bell;
  
  cGoccia(float hu_) {
    pt = new PVector();
    v = new PVector();
    rad = int(random(5, 20));
    hu = hu_ + random(-30, 30);
    sa = random(128, 255);
    br = random(128, 255);
    bell = random(1) > 0.5;
  }
  
  void setvel(PVector v_) {
    v = v_.get();
    v.x += random(-0.5, 0.5);
    v.y += random(-0.5, 0.5);
  }
  
  void _draw() {
    pt.add(v);

    if (bell) {
      fill(hu, sa, br, 128);
      ellipse(pt.x, pt.y, rad, rad);
    }
    else {
      int rad2 = 3 * rad / 4;
      tint(hu, sa, br);
      beginShape();
      texture(tex);
      vertex(pt.x - rad2, pt.y - rad2, 0, 1);
      vertex(pt.x + rad2, pt.y - rad2, 1, 1);
      vertex(pt.x + rad2, pt.y + rad2, 1, 0);
      vertex(pt.x - rad2, pt.y + rad2, 0, 0);
      endShape(CLOSE);
    }
    
    // collisione sul piano verticale destro
    if (pt.x > width - rad/2) {
      pt.x = width - rad/2;
      v.x = -v.x + random(-1, 1);
      v.y += random(-1, 1);
      v.mult(0.8);
    }

    // collisione sul piano verticale sinistro
    if (pt.x < rad/2) {
      pt.x = rad/2;
      v.x = -v.x + random(-1, 1);
      v.y += random(-1, 1);
      v.mult(0.8);
    }
    
    // collisione sul piano orizzontale
    if (pt.y > height - rad/2) {
      pt.y = height - rad/2;
      float m = v.mag();
      v.x += random(-5, 5);
      v.y = -v.y + random(-1, 1);
      v.normalize();      
      v.mult(m * 0.9);
    }
    
    v.y += 0.05;
    // attrito
    v.mult(0.992);
    eta--;
  }
}

