
Snow[] snows = new Snow[200];
Crystal[] crystals = new Crystal[10];

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0; i < snows.length; i++) {
    snows[i] = new Snow();
  }

  for (int j = 0; j < crystals.length; j++) {
    crystals[j] = new Crystal();
  }
}

void draw() {
  background(224,83,39);

  for (int i = 0; i < snows.length; i++) {
    snows[i].move();
    snows[i].display();
  }

  for (int j = 0; j < crystals.length; j++) {
    crystals[j].move();
    crystals[j].display();
  }
}

class Crystal {
  float x = random(width);
  float y = random(height);
  float t = random(TWO_PI);
  float t_spd = random(0.01, 0.05);
  int t_sign;
  float y_spd  = random(0.5, 1);
  float R = random(2, 8);
  float hue = random(180, 250);

  Crystal() {
    if (random(1) >= 0.5) {
      t_sign = 1;
    } else {
      t_sign = -1;
    }
  }

  void move() {
    t += t_sign * t_spd;
    y += y_spd;

    if (y > height + R*3) {
      y = -R*3;
    }
  }

  void display() {
    noFill();
    stroke(hue, 30, 100);

    pushMatrix();
    translate(x, y);
    rotate(t);
    strokeWeight(R/2.0);
    beginShape();
    for (int i = 0; i < 6; i++) {
      vertex(R * cos(TWO_PI*i/6), R*sin(TWO_PI*i/6));
    }
    endShape(CLOSE);

    noStroke();
    fill(hue, 30, 100);
    for (int j = 0; j < 6; j++) {
      pushMatrix();
      translate(R * cos(TWO_PI*j/6), R*sin(TWO_PI*j/6));
      rotate(radians(360*j/6.0));
      rect(0, 0, R*3, R/2);

      pushMatrix();
      translate(R*1.5+(R/2)/sqrt(2), ((R/2)/sqrt(2))/2);
      rotate(radians(45));
      rect(0, 0, R*1.5, R/2);
      popMatrix();

      pushMatrix();
      translate(R*1.5, 0);
      rotate(radians(-45));
      rect(0, 0, R*1.5, R/2);
      popMatrix();

      popMatrix();
    }

    popMatrix();
  }
}

class Snow {
  float t = random(width);
  float x;
  float y = random(0, height);
  float y_spd = random(0.3, 1);
  float xoff_delta = random(0.001, 0.002);
  float t_spd = random(0.001, 0.008)/5;
  float r = random(2, 10);

  Snow() {
  }

  void move() {
    float xoff = t;

    x = noise(xoff)*width*4-width*1.5;

    xoff += xoff_delta;

    t+= t_spd;
    y += y_spd;

    if (y > height + r/2) {
      y = -r/2;
    }
  }

  void display() {
    noStroke();
    fill(360, 200);
    ellipse(x, y, r, r);
  }
}



