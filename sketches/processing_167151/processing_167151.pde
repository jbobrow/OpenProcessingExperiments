
// Bustle
// Levente Sandor, 2014

int b = 30; 
int n = 20;

Point[] points = new Point[b];

void setup() {
  size(300, 300);

  ellipseMode(CENTER);

  noStroke();

  for (int i = 0; i < b; i++) {
    Point point = new Point();

    point.x = random(width);
    point.y = random(height);
    point.sx = random(-3, 3);
    point.sy = random(-3, 3);

    points[i] = point;
  }
}

void draw() {
  background(0);

  for (int j = 0; j < n; j++) {
    float d = (n - j) * 6;
    fill(j * 255.0 / n);

    for (int i = 0; i < b; i++) {
      ellipse(points[i].x, points[i].y, d, d);
    }
  }

  for (int i = 0; i < b; i++) {
    points[i].x += points[i].sx;
    points[i].y += points[i].sy;

    if (points[i].x < 0 || points[i].x > width) {
      points[i].sx = -points[i].sx;
    }      

    if (points[i].y < 0 || points[i].y > height) {
      points[i].sy = -points[i].sy;
    }
  }
}

class Point {
  float x, y, sx, sy;
}
