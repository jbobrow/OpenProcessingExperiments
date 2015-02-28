
int repeat = 50;
int rd = 40; //max radius
float sz;
float t; //transparency
Polynom[] polyNoms = new Polynom[repeat];
 
void setup() {
  size(600, 400);
  background(0);
  rectMode(CENTER);
  strokeWeight(2);
 
  for (int i = 0; i < polyNoms.length; i++) {
    t = map(i, 0, repeat, 50, 200);
    sz = random(-rd, rd);
    sz = (sz > 0 && sz < 10) ? 10:sz;
    sz= (sz > -10 && sz <= 0)?-10:sz;
    polyNoms[i] = new Polynom(t, sz);
  }
}
 
void draw() {
  background(#524656);
  for (int i = 0; i < polyNoms.length; i++) {
    polyNoms[i].display();
  }
}
 
void mouseClicked() {
  setup();
}
 
class Polynom {
  float sz, defsize;
  float t,t2;
  float x= width/2 + 3*random(-rd, rd) ;
  float y= height/2 + 2*random(-rd, rd);
  float theta = 0;
  float incr = random(TWO_PI);
  PShape ps;
 
  Polynom(float _t, float _sz) {
    ps = loadShape("svg2.svg");
    ps.disableStyle();
    t = _t;
    sz = _sz;

  }
 
  void display() {
    translate(x, y);
    rotate(theta);
    defsize = sz+(sin(incr)*.5*sz);
    t = map(defsize, 0.5*sz, 1.5*sz, 15, 225);
    t2 = map(defsize, 0.5*sz, 1.5*sz, 0, 50);
    stroke(255, t);
    fill(255, t2);
    shape(ps,0,0,defsize, defsize);
    resetMatrix();
 
    theta += .01;
    incr += .02;
  }
}


