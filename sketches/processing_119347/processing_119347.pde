
ArrayList<Flower> flowers;
ArrayList<Circle> circles;

float hue;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();

  flowers = new ArrayList<Flower>();
  circles = new ArrayList<Circle>();

  for (int p = 0;p < 5;p++) {
    hue = random(360);

    circles.add(new Circle(hue));
  }
}

void draw() {
  background(0);

  Circle circle;
  Flower flower;

  for (int j = 0; j < circles.size();j++) {
    circle = circles.get(j);
    circle.display();
    if (circle.arc_flg == true) {
      circle.alp -= 20;
      if (circle.alp < 0) {
        circles.remove(j);
        hue = random(360);
        circles.add(new Circle(hue));
      }
    }
  }

  noStroke();
  fill(360);
  ellipse(mouseX, mouseY, 10, 10);

  for (int j = 0; j < circles.size();j++) {
    circle = circles.get(j);

    if (dist(mouseX, mouseY, circle.x, circle.y) < circle.r/2) {
      flowers.add(new Flower(mouseX, mouseY, circle.hue));

      circles.remove(j);
      hue = random(360);
      circles.add(new Circle(hue));
    }
  }


  for (int i = 0; i <flowers.size();i++) {
    flower = flowers.get(i);
    flower.display();
    if (flower.finished()) {
      flowers.remove(i);
    }
  }
}

class Circle {
  float r = random(80, 130);
  float x = random(r/2, width-r/2);
  float y = random(r/2, height-r/2);

  float alp = 255;

  float arc_t = 0;
  float arc_t_spd = random(0.01, 0.05);

  float hue;

  boolean arc_flg = false;

  Circle(float tmpHue) {
    hue = tmpHue;
  }

  void display() {
    noStroke();
    fill(360, alp-100);
    ellipse(x, y, r, r);
    strokeCap(SQUARE);
    strokeWeight(10);
    stroke(hue, 100, 100, alp);
    noFill();
    arc(x, y, r, r, 0, arc_t);

    arc_t += arc_t_spd;

    if (arc_t > TWO_PI) {
      arc_flg = true;
    }
  }
}

class Flower {
  int dot_val = (int)random(100, 200);

  Dot[] dots = new Dot[dot_val];

  float x;
  float y;
  float hue;

  float alp = 255;
  float alp_spd = random(3, 6);

  Flower(float tmpX, float tmpY, float tmpHue) {
    x = tmpX;
    y = tmpY;
    hue = tmpHue;

    for (int i = 0; i < dots.length;i++) {
      dots[i] = new Dot(hue);
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
    for (int i = 0; i < dots.length;i++) {
      dots[i].move();
      dots[i].display(alp);
    }

    alp -= alp_spd;

    popMatrix();
  }

  boolean finished() {
    if (alp < 0) {
      return true;
    }
    else {
      return false;
    }
  }
}

class Dot {
  float hue;

  float R = random(10, 100);
  float theta = random(TWO_PI);

  float x;
  float y;

  float goal_x = R * cos(theta);
  float goal_y = R * sin(theta);

  float easing_x = random(0.03, 0.07);
  float easing_y = random(0.03, 0.07);

  float sat = random(30, 100);
  float brt = random(30, 100); 

  Dot(float tmpHue) {
    x = 0;
    y = 0;
    hue = tmpHue;
  }

  void move() {
    x += (goal_x - x) * easing_x;
    y += (goal_y - y) * easing_y;
  }

  void display(float alp) {
    strokeCap(ROUND);
    strokeWeight(5);
    stroke(hue, sat, brt, alp);
    point(x, y);
  }
}

