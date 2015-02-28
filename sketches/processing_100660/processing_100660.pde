
Line[] lines = new Line[100]; 

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();

  for (int i = 0 ; i < lines.length;i++) {
    lines[i] = new Line();
  }
}

void draw() {
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);

  for (int i = 0 ; i < lines.length;i++) {
    lines[i].move();
    lines[i].display();
  }
}

class Line {
  float x = width/2;
  float y = height/2;
  float r = random(180);
  float t = random(TWO_PI);
  float goal_x = width/2 + r * cos(t);
  float goal_y = height/2 + r * sin(t);
  float easing_x = random(0.05, 0.07)/2;
  float easing_y = random(0.05, 0.07)/2;

  float c = random(100, 360);
  float stroke_w = random(5);

  Line() {
  }

  void move() {
    stroke(c, 80);
    strokeWeight(stroke_w);
    x += (goal_x - x) * easing_x;
    y += (goal_y - y) * easing_y;

    if ((int)goal_x == (int)x || (int)goal_y == (int)y) {
      r = random(180);
      t = random(TWO_PI);
      easing_x = random(0.05, 0.07)/2;
      easing_y = random(0.05, 0.07)/2;
      goal_x = width/2 + r * cos(t);
      goal_y = height/2 + r * sin(t);
    }
  }

  void display() {
    line(width/2, height/2, x, y);
  }
}



