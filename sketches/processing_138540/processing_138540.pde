
Flower[] flowers = new Flower[7];

void setup() {
  size(850, 160);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  strokeWeight(5);

  for (int i = 0 ; i < flowers.length;i++) {
    flowers[i] = new Flower(i);
  }
}

void draw() {
  background(360);

  for (int i = 0 ; i < flowers.length;i++) {
    flowers[i].display();
    flowers[i].anime();
  }
}

class Flower {
  int vertex_num = 100;

  float ox;
  float oy = height/2;
  float x;
  float y;
  float a;
  float r1 = 0;
  float t1 = ((int)random(1, 9))/10.0;
  float r2 = 0;
  float t2 = 1.0;
  float h2 = 0;
  int h2_flg = 1;

  float r1_goal = r1 + t1;
  float r2_goal = r2 + t2;

  float curve_r = 40;
  float curve_r_delta = random(0.5, 2)/2;

  float hue;
  float alp = 120;

  float theta = random(TWO_PI);
  int theta_sign = -1;

  Flower(int num) {
    ox = num * curve_r * 3 + curve_r*1.5;
    hue = 360 * num / 7;

    h2 = 0.1 * num;
  }

  void anime() {
    theta += theta_sign * 0.01;

    if (h2_flg == 1) {
      h2 += 0.005;
      if (h2 > 0.7) {
        h2 = 0.7;
        h2_flg *= -1;
      }
    }
    else {
      h2 -= 0.005;
      if (h2 < 0) {
        h2 = 0;
        t1 = ((int)random(1, 9))/10.0;
        h2_flg *= -1;
      }
    }
  }

  void display() {
    pushMatrix();
    translate(ox, oy);
    rotate(theta);

    stroke(hue, 80, 100, alp);
    fill(hue, 50, 100, alp);

    beginShape();

    for (int i = 0;i < vertex_num;i++) {
      a = sin(r2) * h2 + 1;

      x = curve_r * a * sin(r1);
      y = curve_r * a * cos(r1);

      r1 += t1;
      r2 += t2;

      curveVertex(x, y);
    }
    endShape();
    r1 = r1_goal;
    r2 = r2_goal;


    popMatrix();
  }
}

