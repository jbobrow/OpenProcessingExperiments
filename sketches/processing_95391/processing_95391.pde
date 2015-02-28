
ArrayList<Walker> walkers = new ArrayList<Walker>();
int MAX_WALKER = 10;

void setup() {
  size(500, 500);
  //frameRate(30);
  colorMode(HSB, 360, 100, 100);
  background(360);

  for (int i = 0; i < MAX_WALKER;i++) {
    Walker walker = new Walker();
    walkers.add(walker);
  }
}

void draw() {
  for (int i = 0;i < 36; i++) {
    pushMatrix();
    translate(width/2+150*cos(radians(360*i/36-90)), height/2+150*sin(radians(360*i/36-90)));
    for (Walker walker:walkers) {
      walker.walk();
      walker.draw(i);
    }
    popMatrix();
  }
}

class Walker {
  float x, y;
  float t;
  float hue;
  float rect_w = 1;
  float rect_h;

  Walker() {
    //this.hue = hue;
    this.t = random(TWO_PI);
    rect_h = random(1,5);
  }

  void walk() {
    this.x += random(-1, 1)*2;
    this.y += random(-1, 1)*2;

    if (mag(x, y) > 100) {
      this.x = random(10);
      this.y = random(10);
    }
  }

  void draw(float i) {
    
    pushMatrix();
    translate(x, y);
    rotate(t);
    noFill();
    stroke(i*10, 80, 100, 10);
    rect(0, 0, rect_w, rect_h);
    popMatrix();

    t += 0.5;
  }
}



