
LightObj[] objs = new LightObj[4];

color bgcolor = color(0);

void setup() {
  size(300,300);
  background(bgcolor);
  smooth();
  strokeJoin(ROUND);

  for (int i = 0 ; i < objs.length;i++) {
    objs[i] = new LightObj(i);
  }
}

void draw() {
  background(bgcolor);

  for (int i = 0 ; i < objs.length;i++) {
    objs[i].move();
    objs[i].display();
  }
}

void mousePressed() {
  for (int i = 0 ; i < objs.length;i++) {
    objs[i].c = color(random(255), random(255), random(255));
  }
}

class LightObj {
  Heart[] hearts = new Heart[2];
  Star[] stars = new Star[2];

  float r = random(60, 100);
  float x = random(r/2, width-r/2);
  float y = random(r/2, height-r/2);

  float x_spd = random(1, 3)/3;
  int x_sign;
  float y_spd = random(1, 3)/3;
  int y_sign;

  float theta = random(TWO_PI);
  float theta_spd = random(0.01, 0.05);
  int theta_sign;

  color c = color(random(255), random(255), random(255));
  color black = color(0, 0, 0);
  color white = color(255, 255, 255);
  color tmp;

  int num;

  LightObj(int tmpNum) {
    num = tmpNum;

    for (int i = 0; i < hearts.length;i++) {
      hearts[i] = new Heart();
    }
    for (int j = 0; j < stars.length;j++) {
      stars[j] = new Star();
    }

    if (random(1) >= 0.5) {
      x_sign = 1;
    } else {
      x_sign = -1;
    }
    if (random(1) >= 0.5) {
      y_sign = 1;
    } else {
      y_sign = -1;
    }

    if (random(1) >= 0.5) {
      theta_sign = 1;
    } else {
      theta_sign = -1;
    }
  }

  void move() {
    x += x_sign * x_spd;
    y += y_sign * y_spd;

    if (x <  r/2 || x > width - r/2) {
      x_sign *= -1;
    }
    if (y < r/2 || y > height - r/2) {
      y_sign *= -1;
    }
  }

  void display() {
    int w = 3;

    noFill();
    strokeWeight(w);

    for (int i = 0 ; i < 20; i++) {
      if (i <= 9) {
        tmp = lerpColor(black, c, 0.05* i);
        stroke(tmp);
      } else {
        tmp = lerpColor(c, white, 0.05 * i);
        stroke(tmp);
      }
      if (i == 9) {
        fill(white);
      }

      pushMatrix();
      translate(x, y);
      rotate(theta);
      if (num % 2 == 0) {
        for (int p = 0 ; p < hearts.length;p++) {
          hearts[p].heart((r-i*w)/25);
        }
      } else {
        for (int q = 0 ; q < stars.length;q++) {
          stars[q].star((r-i*w)/2);
        }
      }
      popMatrix();
    }

    theta += theta_sign * theta_spd;
  }
}

class Heart {
  Heart() {
  }

  void heart(float r) {
    beginShape();
    for (float i = 0; i< TWO_PI;i+=0.05) {
      curveVertex(calc_x(r, i), calc_y(r, i));
    }
    endShape(CLOSE);
  }

  float calc_x(float r, float t) {
    float x;

    x = r *(16 * sin(t) * sin(t) * sin(t));

    return x;
  }

  float calc_y(float r, float t) {
    float y;

    y = -1 * r * (13 * cos(t) - 5 * cos(2*t) - 2 * cos(3 * t) - cos(4 * t) );

    return y;
  }
}

class Star {
  int num = 5 * 2;
  float R;
  //float R_out;
  float R_in;

  Star() {
  }

  void star(float R_out) {
    R_in = R_out / 3.0;

    beginShape();
    for (int i = 0;i < num;i++) {
      if (i % 2 == 0) {
        R = R_out;
      } else {
        R = R_in;
      }
      vertex(R * cos(radians(360 * i / num)), R * sin(radians(360 * i /num)));
    }
    endShape(CLOSE);
  }
}




