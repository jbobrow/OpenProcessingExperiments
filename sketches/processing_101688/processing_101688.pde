
Circle[] circles = new Circle[10];

color bgcolor = color(0);

void setup() {
  size(400, 400);
  background(bgcolor);
  smooth();

  for (int i = 0 ; i < circles.length;i++) {
    circles[i] = new Circle();
  }
}

void draw() {
  background(bgcolor);

  for (int i = 0 ; i < circles.length;i++) {
    circles[i].move();
    circles[i].display();
  }
}

class Circle {
  float hue =  random(360);
  float r = random(50, 100);
  float x = random(r/2, width-r/2);
  float y = random(r/2, height-r/2);


  float x_spd = random(1, 3)/3;
  int x_sign;
  float y_spd = random(1, 3)/3;
  int y_sign;

  color c = color(random(255), random(255), random(255));
  color black = color(0, 0, 0);
  color white =  color(255, 255, 255);
  color tmp;
  color check;

  Circle() {
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
        fill(255);
      }

      ellipse(x, y, r-i*w, r-i*w);
    }
  }
}



