
Circle[] circles = new Circle[10];

color bgcolor = color(0);
color black = color(0, 0, 0);
color white =  color(255, 255, 255);

PGraphics fbo;

void setup() {
  size(400, 400);
  background(bgcolor);
  smooth();

  for (int i = 0 ; i < circles.length;i++) {
    circles[i] = new Circle();
  }
  fbo = createGraphics(width, height);
}

void draw() {
  for (int i = 0 ; i < circles.length;i++) {
    circles[i].move();
  }
  fbo.beginDraw();
  fbo.background(bgcolor);
  for (int i = 0 ; i < circles.length;i++) {
    circles[i].displayBaseGradient(fbo);
  }
  fbo.endDraw();
  background(bgcolor);
  for (int i = 0 ; i < circles.length;i++) {
    circles[i].pickColor(fbo);
    circles[i].display();
  }
  //image(fbo, 0, 0);
}

class Circle {
  float r = random(50, 100);
  float x = random(r/2, width-r/2);
  float y = random(r/2, height-r/2);


  float x_spd = random(1, 3)/3;
  int x_sign;
  float y_spd = random(1, 3)/3;
  int y_sign;

  color c = color(random(255), random(255), random(255));
  color cb = black;
  color tmp;
  color check;
  int base_alpha = 96;

  Circle() {
    if (random(1) >= 0.5) {
      x_sign = 1;
    } 
    else {
      x_sign = -1;
    }
    if (random(1) >= 0.5) {
      y_sign = 1;
    } 
    else {
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
        tmp = lerpColor(cb, c, 0.05* i);
        stroke(tmp);
      } 
      else {
        tmp = lerpColor(c, white, 0.05 * i);
        stroke(tmp);
      }
      if (i == 9) {
        fill(255);
      }

      ellipse(x, y, r-i*w, r-i*w);
    }
  }
  void pickColor(PImage img) {
    cb = img.get((int)x, (int)y);
    cb = color(red(cb),green(cb),blue(cb),base_alpha);
  }
  void displayBaseGradient(PGraphics g) {
    float step = 20;
    float ratio = 2.5;
    int w = (int)(r*ratio/step);

    g.noFill();
    g.strokeWeight(w);
    for (int i = 1 ; i <= step; i++) {
      g.stroke(lerpColor(color(0, 0, 0, 0), color(red(c), green(c), blue(c), base_alpha), i/step));
      g.ellipse(x, y, r-i*w, r-i*w);
    }
  }
}

