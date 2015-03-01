
//declare
Wave [] waves = new Wave[30];

void setup() {
  size(600, 400);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 0, 100);

  //initialize
  initial();
}

void draw() {
  fade();
  // call functionarity
  translate(width/2, height/2);
  for (int i = 0; i < waves.length; i++) {
    waves[i].keyPressed();
    waves[i].display();
  }
}

void fade() {
  noStroke();
  fill(0, 0, 0, 5);
  rect(0, 0, width, height);
}

void initial(){
 for (int i = 0; i < waves.length; i++) {
    waves[i] = new Wave(random(30,200),i*20, i*10, i/2);
  }
}

void mouseReleased(){
  background(0, 0, 0, 100);
  initial();
}
class Wave {
  //global variables
  float x,y,r;
  float theta;
  float off, offv;
  float ch, cs;
  float sr;
  //constructor
  Wave(float _r, float _theta, float _off, float _sr) {
    off = _off;
    sr =_sr;
    theta = _theta;
    r = _r;
    ch = 0;
    cs = 100;
  }
  //functions
  void display() {
    theta += 0.08;
    x = r*cos(theta + off/offv);
    y = r*sin(theta + off);
    ch = map(mouseX, 0, width, 30, 290);
    cs = map(mouseY, 0, height, 30, 100);
    fill(ch, cs, 100, 100);
    noStroke();
    ellipse(x, y, sr, sr);
  }

  void keyPressed() {
    if (key == '1') {
      offv = 1;
    } else if (key == '2') {
      offv = 0.5;
    } else if (key == '3') {
      offv = 0.8;
    } else if (key == '4') {
      offv = 2;
    } else {
      offv = 1;
    }
  }
}



