
ArrayList points;

float x = 0;

void setup() {
  background(0);
  size(700, 700, P3D);
  smooth();
  points = new ArrayList();
  stroke(255);
  strokeWeight(1);
}

void draw() {
  translate(width/2, 0);
  lights();
  if(keyPressed && key == ' ') {
    x = x + 0.5;
  }

  rotateY(x);

  for(int i = points.size() - 1; i >= 0; i--) {
    Point dots = (Point) points.get(i);
    dots.display();
  }
}

void mouseDragged() {
  points.add(new Point());
  Point pointz = (Point) points.get(points.size() - 1);
  pointz.setValues(pmouseX - width/2, pmouseY, mouseX - width/2, mouseY);
}

void keyPressed() {
  if(key == 'a') {
    setup();
  }
}

void keyReleased() {
  x = 0;
}






