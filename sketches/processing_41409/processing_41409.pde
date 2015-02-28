
Blob [] B = new Blob [50];

int d = 0;

void setup() {
  size(400, 400);
  smooth();
  background(255, 43, 133);

  for (int i = 0; i < B.length; i ++) {
    B[i] = new Blob(random(0, width), random(0, height));
  }
}

void draw () {
  
  for (int i = 0; i < B.length; i ++) {

    pushMatrix();
    translate(width/2, height/2);

    B[i].move();
    B[i].display();

    popMatrix() ;
  }
}

class Blob {

  float x;
  float y;

  Blob (float x, float y) {
  }

  void display() {
    stroke(d);
    point(x, y);
    d--;
  }

  void move() {
    x = x + random(-1, 1);
    y = y + random(-1, 1);
  }
}


