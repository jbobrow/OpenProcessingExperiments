
Walker[] walker = new Walker[7];

void setup() {
  size(500, 500);
  frameRate(1000);
  colorMode(HSB, 360, 100, 100);
  background(360);
  for (int i = 0; i < walker.length;i++) {
    walker[i] = new Walker(width/2, height/2, 360*i/walker.length);
    walker[i].draw();
  }
}

void draw() {
  for (int i = 0; i < walker.length;i++) {
    walker[i].walk();
    walker[i].draw();
  }
}

class Walker {
  float x, y;
  float t;
  float hue;
  float rect_w = 1;
  float rect_h = 5;

  Walker(float x, float y, float hue) {
    this.x = x;
    this.y = y;
    this.hue = hue;
    t = random(TWO_PI);
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
    stroke(hue, 80, 100, 10);
    rect(0, 0, rect_w, rect_h);
    popMatrix();

    t += 0.5;
  }
}



