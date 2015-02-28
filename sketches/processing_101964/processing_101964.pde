
Calc[] calc = new Calc[300];

float hue;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0 ; i < calc.length;i++) {
    calc[i] = new Calc();
  }
}

void draw() {
  background(360);

  noStroke();
  fill(hue, 80, 100);
  pushMatrix();
  translate(width/2, height/2);
  beginShape();
  for (int i = 0 ; i < calc.length;i++) {
    curveVertex(calc[i].x, calc[i].y);
    calc[i].coordinateUpdate();
  }
  endShape(CLOSE);
  popMatrix();

  hue += 0.5;

  if (hue > 360) {
    hue = 0;
  }
}

class Calc {
  Easing easing = new Easing();

  float x = random(-width/2, width/2);
  float y = random(-height/2, height/2);

  Calc() {
  }

  void coordinateUpdate() {
    PVector acceleration = easing.ease(x, y);
    x +=acceleration.x;
    y +=acceleration.y;
  }
}

class Easing {
  float next_x = random(-width/2, width/2);
  float next_y = random(-height/2, height/2);
  float easing_x = random(0.01, 0.04);
  float easing_y = random(0.01, 0.04);

  PVector ease(float x, float y) {
    PVector acceleration = new PVector( (next_x - x) * easing_x, (next_y - y) * easing_y);
    if ((int)next_x == (int)x || (int)next_y == (int)y) {
      next_x = random(-width/2, width/2);
      next_y = random(-height/2, height/2);
    }
    return acceleration;
  }
}



