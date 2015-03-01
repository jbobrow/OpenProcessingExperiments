
Kirakira[] kira = new Kirakira[50];

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  strokeWeight(3);

  for (int i = 0; i < kira.length; i++) {
    kira[i] = new Kirakira();
  }
}

void draw() {
  background(360);

  for (int i = 0; i < kira.length; i++) {
    kira[i].display();
    kira[i].move();
  }
}

class Kirakira {
  float delta = TWO_PI / 100;

  float x = random(width);
  float y = random(height);
  float hue_fill = random(360);
  float hue_stroke = random(360);

  float R;
  float R_start = random(10, 30);
  float R_height = random(1.2, 1.6);
  float R_theta = random(TWO_PI);
  float R_theta_delta = random(0.03, 0.08);

  float y_spd = random(1, 3);

  Kirakira() {
  }

  void display() {
    fill(hue_fill, 50, 100, 80);
    stroke(hue_stroke, 100, 100, 80);
    pushMatrix();
    translate(x, y);
    beginShape();
    for (float t = 0; t < TWO_PI; t += delta) {
      vertex(R* pow(cos(t), 3), R * R_height * pow(sin(t), 3));
    }
    endShape(CLOSE);
    popMatrix();

    R = R_start * abs(sin(R_theta)) ;

    R_theta += R_theta_delta;
  }

  void move() {
    y -= y_spd;

    if (y < -R * R_height) {
      y = height + R * R_height;
    }
  }
}



