
Triangle[] tri = new Triangle[15];

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0; i < tri.length;i++) {
    tri[i] = new Triangle();
  }

  strokeWeight(2);
}

void draw() {
  noStroke();
  fill(360, 40);
  rect(0, 0, width, height);

  noFill();

  for (int i = 0; i < tri.length;i++) {
    tri[i].move();
    tri[i].display();
  }
}

class Triangle {
  float goal_r = random(10, 100);
  float r;
  float r_delta = random(0.1, 1);
  float theta;
  float theta_delta = random(0.005, 0.025);
  int theta_sign;
  float ox = random(width);
  float oy = random(height);
  float hue = random(360);

  Triangle() {
    if (random(1) >= 0.5) {
      theta_sign = 1;
    }
    else {
      theta_sign = -1;
    }
  }

  void move() {
    r += r_delta;
    theta += theta_sign * theta_delta;
    if (r > goal_r) {
      r = 0;
      ox = random(width);
      oy = random(height);
    }
  }

  void display() {
    stroke(hue, 100, 100, 80);
    noFill();

    pushMatrix();
    translate(ox, oy);
    rotate(theta);
    beginShape();
    for (int i = 0 ; i < 3;i++) {
      vertex(r * sin(2*PI*i/3), -r * cos(2*PI*i/3));
    }
    endShape(CLOSE);
    popMatrix();
  }
}



