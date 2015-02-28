
int PointCount = 1000;
Point[] myPoint = new Point[PointCount];
PVector Target;
PVector pos;
PVector vel;
PVector acc;

void setup() {
  background(0);
  size(500, 500,P2D);
  smooth();
  for (int i =0;i<myPoint.length;i++) {
    pos = new PVector(random(width), random(height));
    vel = new PVector(0.0, 0.0);
    acc = new PVector(0.0, 0.0);
    myPoint[i] = new Point(pos, vel, acc, #00FAE7, 2);
    Target = new PVector(0.0, 0.0);
  }
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
//background(0);
  float mx = constrain(mouseX, 0, width);
  float my = constrain(mouseY, 0, height);
  Target.x = mx;
  Target.y = my;
  for (int i =0;i<myPoint.length;i++) {
    myPoint[i].update();
    myPoint[i].display();
  }
}

class Point {
  PVector pointPos;
  PVector Vel;
  PVector Acc;
  int pointWeight;
  color pointColor;

  Point(PVector _pointPos, PVector _Vel, PVector _Acc, color _pointColor, int _pointWeight ) {
    pointPos = _pointPos;
    Vel = _Vel;
    Acc = _Acc;
    pointColor = _pointColor;
    pointWeight = _pointWeight;
  }

  void update() {
    PVector d = PVector.sub(Target, pointPos);
    d.normalize();
    Acc.set(d);
    Acc.div(2);
    Vel.add(Acc);
    pointPos.add(Vel);
  }

  void display() {

    pushStyle();
    strokeWeight(pointWeight);
    stroke(pointColor);
    point(pointPos.x, pointPos.y);
    popStyle();
  }
}



