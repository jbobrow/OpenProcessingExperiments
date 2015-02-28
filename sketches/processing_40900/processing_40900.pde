

Path [] paths = new Path[100];

void setup() {
  size(200, 200);
  background(200);
  colorMode(HSB);
  for (int i=0;i<paths.length;i++) {
    paths[i] = new Path();
  }
}

void draw() {
  for (int i=0;i<paths.length;i++) {
    paths[i].update();
    paths[i].display();
  }
}


class Path {
  float x = random(width);
  float y = random(height);
  color c = color(floor(random(255)),100,100);

  Path() {
  }

  void update() {
    x = x + random(-5, 5);
    y = y + random(-5, 5);
  }

  void display() {
    noStroke();
    smooth();
    fill(c);
    ellipse(x, y, 5,5);
  }
}


