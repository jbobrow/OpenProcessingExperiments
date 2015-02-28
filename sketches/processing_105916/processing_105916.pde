
Toge[] toges = new Toge[10];

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0 ; i < toges.length;i++) {
    toges[i] = new Toge();
  }
}

void draw() {
  background(360);

  for (int i = 0 ; i < toges.length;i++) {
    toges[i].move();
    toges[i].display();
  }
}

class Toge {
  int num = (int)random(4, 12)*2; 
  float R;
  float R_out = random(50, 100);
  float R_in = R_out/3.0;

  float x = random(width);
  float y = random(height);

  float S = 0;
  float S_spd = random(0.005, 0.02);

  float hue  = random(360);
  float alp = 255;

  float theta = random(TWO_PI);
  float theta_spd = random(0.005, 0.02);
  int theta_sign;

  Toge() {
    if (random(1) >= 0.5) {
      theta_sign = 1;
    }
    else {
      theta_sign = -1;
    }
  }

  void move() {
    S += S_spd;

    theta += theta_sign * theta_spd;

    if (S > 1) {
      alp -= 10;
      if (alp < 0) {
        S = 0;
        R_out = random(50, 100);
        R_in = R_out/3.0;
        alp = 255;
        hue  = random(360);
        num = (int)random(4, 12)*2; 
        x = random(width);
        y = random(height);
      }
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(theta);

    noFill();
    stroke(hue, 100, 100, alp);
    beginShape();
    for (int i = 0;i < num;i++) {
      if (i % 2 == 0) {
        R = R_out;
      }
      else {
        R = R_in;
      }
      vertex(R * cos(radians(360 * i / num)) * S, R * sin(radians(360 * i /num)) * S);
    }
    endShape(CLOSE);

    popMatrix();
  }
}



