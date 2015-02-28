
class Point {
  float x, y;
  
  Point(float pX, float pY) {
    x = pX;
    y = pY;
  }
}

Point getThirdPoint(Point a, Point b, float alpha) {
  float dx, dy, l1, l2, m, n;
  float beta;
  boolean reversed = false;
  
  dx = b.x - a.x;
  dy = b.y - a.y;
  if (dx < 0) {
    reversed = true;
    dx *= -1;
    dy *= -1;
  }
  
  beta = atan(dy / dx);
  
  l1 = sqrt(dx*dx + dy*dy);
  l2 = cos(alpha) * l1;
  
  n = sin(beta-alpha) * l2;
  m = cos(beta-alpha) * l2;
  
  Point c = new Point((int)(a.x + m), (int)(a.y + n));
  if (reversed) {
    c.x = a.x - m;
    c.y = a.y - n;
  }
  return c;
}

float[] angles = new float[30];
float[] speeds = new float[angles.length];
float[] acceleration = new float[angles.length];
float currentStrokeWeight;
final float redRange = 255.0 / 12.0;
final float greenRange = 255.0 / 0.01;
final float blueRange = 255.0 / (PI/2);

void setup() {
  size(700, 700);
  frameRate(40);
  stroke(0);
  
  paused = false;
  for (int i=0; i<angles.length; ++i) {
    angles[i] = random(0, PI/2);
    speeds[i] = (i%2==0)?0.001:-0.001;
    acceleration[i] = 0;
  }
}

void draw() {
  background(0);
  currentStrokeWeight = 10;
  Point[] p = new Point[4];
  p[0] = new Point(300, 300);
  p[1] = new Point(305, 300);
  p[2] = new Point(305, 305);
  p[3] = new Point(300, 305);
  Point[] pTemp = new Point[4];
  
  for (int layerI=0; layerI<angles.length; ++layerI) {
    
    for (int i=0; i<4; ++i) {
      pTemp[i] = getThirdPoint(p[i], p[(i+1)%4], angles[layerI]);
      fill(angles[layerI]*blueRange,(255-layerI*redRange),((speeds[layerI]+0.005)*greenRange)-i*30);
      triangle(pTemp[i].x, pTemp[i].y, p[i].x, p[i].y, p[(i+1)%4].x, p[(i+1)%4].y);
    }
    if (pTemp[0].x > 900) {
      break;
    }
    for (int i=0; i<4; ++i) {
      p[i] = pTemp[i];
    }
    
    acceleration[layerI] += random(-0.0001, 0.0001);
    acceleration[layerI] = max(-0.002, min(0.002, acceleration[layerI]));
    speeds[layerI] += acceleration[layerI];
    speeds[layerI] = max(-0.005, min(0.005, speeds[layerI]));
    angles[layerI] += speeds[layerI];
    if (angles[layerI] > PI/2) {
      angles[layerI] -= PI/2;
    }
    if (angles[layerI] < 0) {
      angles[layerI] += PI/2;
    }
    currentStrokeWeight += max(-1, min(1, speeds[layerI]*1000));
    currentStrokeWeight = max(10, currentStrokeWeight);
    strokeWeight(currentStrokeWeight);
  }
}


