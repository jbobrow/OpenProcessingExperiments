
int repeat = 20;
int rd = 70; 
int rd2 = 50; 
int rd3 = 60; 
float sz;
float t; //transparency
Polynom[] polyNoms = new Polynom[repeat];

void setup() {
  size(600, 400);
  smooth();
  frameRate(20);
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
  background(#120306);

  for (int i = 0; i < polyNoms.length; i++) {
    polyNoms[i].display();
  }
  for (int i = 0; i < polyNoms.length; i++) {
    polyNoms[i].display2();
  }
  for (int i = 0; i < polyNoms.length; i++) {
    polyNoms[i].display3();
  }
// if (frameCount % 4 == 0 && frameCount < 121) saveFrame("###.gif");

}
  
void mouseClicked() {
  setup();
}
  
class Polynom {
  float sz, defsize;
  float t,t2;
  float x= width/2 + 3*random(-rd, rd) ;
  float y= height/2 + 2*random(-rd, rd);
  float x2= width/2 + 3*random(-rd2, rd2) ;
  float y2= height/2 + 2*random(-rd2, rd2);  
  float x3= width/2 + 3*random(-rd3, rd3) ;
  float y3= height/2 + 2*random(-rd3, rd3);    
  float theta = 0;
  float incr = random(TWO_PI);
  PShape ps;
  
  Polynom(float _t, float _sz) {
    ps = loadShape("svg7.svg");
    ps.disableStyle();
    t = _t;
    sz = _sz;
  }
  
  void display() {
    translate(x, y);
    rotate(theta);
    defsize = sz+(sin(incr)*.5*sz);
    t = map(defsize, 0.5*sz, 1.5*sz, 15, 225);
    noFill();
    stroke( #DD4764, t );
    shape(ps,0,0,defsize, defsize);
    resetMatrix();
  
    theta += .01;
    incr += .02;
  }

void display2() {
    translate(x2, y2);
    rotate(theta);
    defsize = sz+(sin(incr)*.5*sz);
    t = map(defsize, 0.5*sz, 1.5*sz, 15, 225);
    noFill();
    stroke( #16CDDD, t );
    shape(ps,0,0,defsize, defsize);
    resetMatrix();
  
    theta += .01;
    incr += .02;
  }

  void display3() {
    translate(x3, y3);
    rotate(theta);
    defsize = sz+(sin(incr)*.5*sz);
    t = map(defsize, 0.5*sz, 1.5*sz, 15, 225);
    noFill();
    stroke( #A4AD12, t );
    shape(ps,0,0,defsize, defsize);
    resetMatrix();
  
    theta += .01;
    incr += .02;
  }

}




