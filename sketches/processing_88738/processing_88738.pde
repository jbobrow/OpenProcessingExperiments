
Sakura [] sakuraArray = new Sakura[100];
Shuriken [] shurikenArray = new Shuriken[10];
boolean isSakura = true;

float width2;
float height2;

void setup() {
  size(640, 480);
  noStroke();
  fill(255);

  smooth();
  int randIro; 
  for (int i=0; i<sakuraArray.length; i++) {
    randIro = rand(205)+50;
    sakuraArray[i] = new Sakura(int(random(width)), int(random(height)), random(90)+15, 
    color(255, randIro, randIro, 200));
    for (int j=0; j<shurikenArray.length; j++) {
      randIro = rand(205)+50;
      shurikenArray[j] = new Shuriken(int(random(width)), int(random(height)), random(90)+15, 
      color(0, 0, 0, 200));
    }
  }

  frameRate(30);
}

int rand(int n) {
  return int(random(n));
}


void draw() {
  background(255);

  for (int i=0; i<shurikenArray.length; i++) {
    shurikenArray[i].update();
    shurikenArray[i].draw();
  }

  for (int i=0; i<sakuraArray.length; i++) {
    sakuraArray[i].update();
    sakuraArray[i].draw();
  }
}


void yuki(int x, int y, int r, float rad, boolean isSakura) {
  pushMatrix();
  translate(x, y);
  rotate(rad);
  for (int i=0;i<6; i++) {
    rotate(TWO_PI/6);
    if (isSakura) {
      petal(0, -r/2, r/2, r);
    }
    else {
      blade(0, -r/2, r/2, r);
    }
  }
  popMatrix();
}

void petal(int x, int y, int w, int h) {
  beginShape();
  vertex(x-w/2, y);
  vertex(x-5, y-h/2-5);
  vertex(x, y-h/2);
  //vertex(x/2, h); shuriken
  //vertex(x-w/2,y-w); lily
  //sakura
  vertex(x+5, y-h/2-5);
  vertex(x+w/2, y);
  vertex(x, y+h/2);
  endShape(CLOSE);
}

class Sakura {
  int x;
  int y;
  float rad;
  float hayasa;
  color iro;

  final int R = 40;

  Sakura(int x, int y, float hayasa, color iro) {
    this.x = x;
    this.y = y;
    this.hayasa = hayasa;
    this.iro = iro;
  }

  void draw() {
    fill(iro);
    yuki(x, y, R, rad, true);
  }

  void update() {
    rad += hayasa/60*PI/15;
  }
}
void blade(int x, int y, int w, int h) {
  beginShape();
  vertex(x, y+h/2);
  vertex(x+w/2, y);
  vertex(x+5, y-h/2-5);
  vertex(x+w/2, y);
  vertex(x/2, h);
  endShape(CLOSE);
}

class Shuriken {
  int x;
  int y;
  float rad;
  float hayasa;
  color iro;

  final int R = 40;

  Shuriken(int x, int y, float hayasa, color iro) {
    this.x = x;
    this.y = y;
    this.hayasa = hayasa;
    this.iro = iro;
  } 

  void draw() {
    fill(iro);
    yuki(x, y, R, rad, false);
  }

  void update() {
    rad += hayasa/60*PI/15;
  }
}



