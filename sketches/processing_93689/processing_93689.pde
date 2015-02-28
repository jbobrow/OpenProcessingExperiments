
Line[] line = new Line[50];

float t = 0;

void setup() {
  size(450, 350);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();

  rectMode(CENTER);

  for (int i = 0; i < line.length;i++) {
    line[i] = new Line();
  }
}

void draw() {
  noStroke();
  fill(0, 20);
  rect(width/2, height/2, width, height);

  for (int i = 0; i < line.length;i++) {
    line[i].display();
    line[i].move();
  }

} 

class Line {
  float x;
  float y;
  float speed;
  float rect_w;
  float rect_h;
  float hue;

  Line() {
    if (random(1) >= 0.5) {
      speed = 1.5;
    }
    else {
      speed = -1.5;
    }

    rect_w = random(220, 280);
    rect_h = random(1, 10);

    x = random(width);
    y = random(height);

    hue = 0;
  }

  void display() {
    noStroke();
    fill(hue, 100, 100, 50);
    rect(x, y, rect_w, rect_h);

    hue++;
    if (hue > 360) {
      hue = 0;
    }
  }

  void move() {
    x += speed;
    if (x > width + random(1, 5)|| x < -random(1, 5)) {
    rect_w = random(220, 280);
    rect_h = random(1, 10);
      y = random(width);

      if (speed > 0) {
        x = - random(1,4);
      }
      else {
        x = width+random(1,4);
      }
    }
  }
}

