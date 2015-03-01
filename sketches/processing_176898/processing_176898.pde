
class Cubo {
  float x, y, z, box_size, col, rot;
  int t = 1;
  int d = 1;

  Cubo(float x, float y, float box_size, float col, float rot) {
    this.z = box_size;
    this.x = x;
    this.y = y;
    this.box_size = box_size;
    this.col = col;
    this.rot = rot;
  }

  void draw_box() {
    lights();
    pushMatrix();
    translate(x, y, z);
    //adding R will rotate all boxes
    rotateX(r + rot);
    rotateY(r + rot);
    fill(col, 255, 255);
    box(box_size);
    popMatrix();

    x = x + t;
    y = y + d;

    if (x > width) {
      x = width;
      t *= -1;
      x = x + t;
    }
    if (x < 0) {
      x = 0;
      t *= -1;
      x = x + t;
    }
    if (y > height) {
      y = height;
      d *= -1;
      y = y + d;
    }
    if (y < 0) {
      y = 0;
      d *= -1;
      y = y + d;
    }
  }
}

float r=0;
boolean bgON=true;

ArrayList<Cubo> cubi = new ArrayList();

PVector location;
PVector speed;
int radius;

void setup() {
  size(640, 480, P3D);
  smooth();
  background(0);
  stroke(255);
  strokeWeight(1);
  colorMode(HSB);
}

void mousePressed() {
  cubi.add( new Cubo(mouseX, mouseY, random(10, 100), random(0, 255), r*0.5));
}

void draw() {
  if (bgON==true) {
    fill(0, 170);
    rect(0, 0, width, height);
  }
  for (Cubo cubo : cubi) {
    cubo.draw_box();
  }
  r=r+0.01;
}

void keyPressed() {
  if (key=='b' || key=='B') {
    if (bgON==true) {
      bgON = false;
    } else {
      bgON = true;
    }
  }
}
