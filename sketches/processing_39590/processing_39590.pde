
Rotateline[] e;
int y1;

void setup() {
  size(500, 500, P3D);
  background(255);
  smooth();
  y1 = 10;
  e = new Rotateline[y1];

  for (int i = 0; i<y1; i++) {
    e[i] = new Rotateline(0, 0.0, 0.0, 0.0, 0);
  }
}

void draw() {

  //background(255);
  for (int i = 0; i < y1; i++) {
    e[i].stage();
  }
}

class Rotateline {

  float y;
  float b;
  float angle;
  float speed;
  float i;

  Rotateline(float yy, float bb, float anglee, float speedd, float ii) {
    y = yy;
    b = bb;
    angle = anglee;
    speed = speedd;
    i = ii;
  }
  void stage() {

    speed = speed + 0.3;

    noFill();
    stroke(0, 40);

    if (b < 50) {
      b = b + 0.3;
    }
    else {
      b = -b;
    }
    if (i < width) {
      
      i = i + 1;

      print("my i="+i);
      pushMatrix();
      translate(i, y);
      rotateY(angle + speed);
      ellipse(0, 0, b, b);
      popMatrix();
    }
    else {
      print("return="+i);
      y = y + 100;
      i = 0;
    };
    
  }
}


