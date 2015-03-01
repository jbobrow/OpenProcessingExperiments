
PVector target;
PVector[] points;
float x, y, angle, ease = 0.5;
boolean easing = true;
int num=150, frames=180;

void setup() {
  size(500, 500);
  points = new PVector[num];
  for (int i=0; i<num; i++) {
    points[i] = new PVector(width/2, height/2);
  }
}

void draw() {
  background(20);
  noStroke();
  float d = 150;
  x = width/2+sin(angle*2)*d;
  y = height/2+cos(angle)*d;
  target = new PVector(x,y);
  PVector leader = new PVector(target.x, target.y);
  for (int i=0; i<num; i++) {
    PVector pt = points[i];
    PVector distance = PVector.sub(leader, pt);
    PVector velocity = PVector.mult(distance, ease);
    pt.add(velocity);
    ellipse(pt.x, pt.y, 70, 70);
    leader = pt;
  }
  angle += TWO_PI/frames;
  //if (frameCount>250 && frameCount<=250+frames) saveFrame("image-###.gif");
}

