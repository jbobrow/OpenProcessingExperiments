
ArrayList<Walker> walkers = new ArrayList<Walker>();
int MAX_WALKER = 10;

void setup() {
  size(600, 450);
  frameRate(500);
  colorMode(HSB, 360, 100, 100);
  background(207,100,100);

  for (int i = 0; i < MAX_WALKER;i++) {
    Walker walker = new Walker(random(width),random(height));
    walkers.add(walker);
  }
}

void draw() {
  
  
for (Walker walker:walkers) {
      walker.walk();
      walker.draw();
    }
}

class Walker {
  float x, y;
  float t;
  float c;
  float rect_w = 1;
  float rect_h = random(10, 20);

  Walker(float x, float y) {
    this.x = x;
    this.y = y;
    this.t = random(TWO_PI);
   // this.c = 
  }

  void walk() {
    this.x += random(-1, 1)*2;
    this.y += random(-1, 1)*2;

    if (this.x < 0) {
      this.x = 0;  //width;
    }
    if (this.y < 0) {
      this.y = 0;  //height;
    }
    if (this.x > width) {
      this.x = width;  //0;
    }
    if (this.y > height) {
      this.y = height;  //0;
    }
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    rotate(t);
    noFill();
    stroke(360, random(10));
    rect(0, 0, rect_w, rect_h);
    popMatrix();

    t += 0.5;
  }
}



