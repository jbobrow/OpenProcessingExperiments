
Flower[] flowers = new Flower[20];

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  background(360);

  for (int i = 0; i < flowers.length; i++) {
    flowers[i] = new Flower();
  }
}

void draw() {
  background(360);

  for (int i = 0; i < flowers.length; i++) {
    flowers[i].move();
    flowers[i].display();
  }
}

class Flower {
  float x = random(width);
  float y = random(height);

  float r;
  float R = 0;
  float W = 200;

  float R_spd = random(3, 6);
  float W_spd = random(1, 4);

  float R_max = random(20, 50);
  float W_min = random(3, 10);

  float hue = random(360);
  float alp = 255;

  float theta = random(TWO_PI);

  int petal_val = (int)random(6, 10);

  Flower() {
  }

  void move() {
    R += R_spd;
    if (R > R_max) {
      R = R_max;

      W -= W_spd;
      if (W < W_min) {
        W = W_min;

        alp -= 5;
        if (alp < 0) {
          alp = 0;

          x = random(width);
          y = random(height);

          R = 0;
          W = 200;
          hue = random(360);

          alp = 255;
        }
      }
    }
  }

  void display() {
    noStroke();
    fill(hue, 50, 100, alp);

    pushMatrix();
    translate(x, y);
    rotate(theta);
    for (int i = 0; i < petal_val; i++) {
      pushMatrix();
      translate(R*cos(radians(360*i/petal_val)), R*sin(radians(360*i/petal_val)));
      rotate(radians(180+360*i/petal_val));

      beginShape();
      for (float t = 0; t < TWO_PI; t += 0.1) {
        r = 1 / (W*sin(t/2)+1);
        vertex( R * r * cos(t), R * r * sin(t));
      }
      endShape(CLOSE);
      popMatrix();
    }
    popMatrix();
  }
}



