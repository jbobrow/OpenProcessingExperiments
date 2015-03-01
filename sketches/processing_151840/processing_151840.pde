
Fly[] arrB;
int max = 500;

void setup() {
  size(400, 400);
  arrB = new Fly[max];
  for (int i=0;i < max; i++) {
    arrB[i] = new Fly(random(max), random(10000, 10000+max));
  }
 // frameRate(27);
}

void draw() {
  background(255);

  for (int i=0;i < max; i++) {
    arrB[i].drawFly();
  }
}

class Fly {
  float x, y;
  float tx;
  float ty;


  Fly(float xx, float yy) {
    tx = xx;
    ty = yy;
  }

  void moveFly() {
    x = map(noise(tx), 0, 1, 0, width);  
    y = map(noise(ty), 0, 1, 0, height);
    tx += 0.01;
    ty += 0.004;
  }

  void drawFly() {
    moveFly();
    strokeWeight(4);
    stroke(0);
    point (x, y);
  }
}



