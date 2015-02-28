
int repeat = 100;
int rd = 40; //max radius
float sz; 
float t; //transparency
Polynom[] polyNoms = new Polynom[repeat];

void setup() {
  size(600, 400);
  background(0);
  rectMode(CENTER);
  noFill();

  for (int i = 0; i < polyNoms.length; i++) {
    t = map(i, 0, repeat, 50, 200);
    sz = random(-rd, rd);
    sz = (sz > 0 && sz < 10) ? 10:sz;
    sz= (sz > -10 && sz <= 0)?-10:sz;
    polyNoms[i] = new Polynom(t, sz);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < polyNoms.length; i++) {
    polyNoms[i].display();
  }
}

void mouseClicked() {
  setup();
}

class Polynom {
  float sz, defsize;
  float t;
  float x= width/2 + 2*random(-rd, rd) ;
  float y= height/2 + 2*random(-rd, rd);
  float theta = 0;
  float incr = random(TWO_PI);
  //float incr = noise(frameCount/100)*random(PI);

  Polynom(float _t, float _sz) {
    t = _t;
    sz = _sz;
  }

  void display() {
    translate(x, y);
    rotate(theta);
    //sz = sz+sin(theta)*20;
    defsize = sz+(sin(incr)*.5*sz);
    t = map(defsize, 0.5*sz, 1.5*sz, 15, 225);
    stroke(255, t);
    //ellipse(0, 0, defsize, defsize);
    rect(0, 0, defsize, defsize);
    resetMatrix();

    theta += .02;
    incr += .04;
  }
}



