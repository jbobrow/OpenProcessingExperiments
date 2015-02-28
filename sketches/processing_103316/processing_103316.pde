
Quad[] quad = new Quad[200];

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();
  rectMode(CENTER);

  for (int i = 0; i < quad.length;i++) {
    if (i < quad.length - quad.length/10) {
      quad[i] = new Quad(0);
    }
    else {
      quad[i] = new Quad(180);
    }
  }
}

void draw() {
  background(360);

  pushMatrix();
  translate(width/2, 0);
  rotate(radians(45));
  for (int i = 0; i < quad.length;i++) {
    quad[i].move();
    quad[i].display();
  }
  popMatrix();
}

class Quad {
  float w = 20;
  float h = random(150, 200);
  float x = random(-width/2, width);
  float y = random(-height/2, height);
  float spd = random(1, 3);

  float hue;

  Quad(float tmpHue) {
    hue = tmpHue;
  }

  void move() {
    y += spd;

    if (y > height + h) {
      y = -h*2;
      x = random(-width/2, width);
    }
  }

  void display() {
    noStroke();
    fill(hue, 100, 80);
    rect(x, y, w, h);

    hue += 0.2;
    if (hue > 360) {
      hue = 0;
    }
  }
}



