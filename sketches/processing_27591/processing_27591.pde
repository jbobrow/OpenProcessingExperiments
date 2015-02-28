
void setup() {
  size(600, 600);
}

void draw() {
}

void mouseClicked() {
  background(255);
  rectMode(CENTER);
  int G = 100;
  float L = G / 2;
  ArrayList<PVector> gridPoints = new ArrayList<PVector>();
  for (int i=1; i<6; i++) {
    for (int j=1; j<6; j++) {
      ellipse(i*G, j*G, 5, 5);
      gridPoints.add(new PVector(i*100, j*100));
    }
  }
  for (int n=0;n<25;n++) {
    fill(255, 0, 0, 128);
    PVector point = gridPoints.remove(0);
    int theta = int(random(2*PI));
    float r = random(L);
    PVector one = new PVector(point.x + cos(theta) * r, point.y + sin(theta) * r);
    PVector two = new PVector(point.x + cos(theta + HALF_PI) * r, point.y + sin(theta + HALF_PI) * r);
    PVector three = new PVector(point.x + cos(theta + PI) * r, point.y + sin(theta + PI) * r);
    PVector four = new PVector(point.x + cos(theta - HALF_PI) * r, point.y + sin(theta - HALF_PI) * r);

    quad(one.x, one.y, two.x, two.y, three.x, three.y, four.x, four.y);
  }
}


