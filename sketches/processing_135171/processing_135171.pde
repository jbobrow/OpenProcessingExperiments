
int nLines = 266;
int nAngles = 8;
float angleInc = 1.0 / 256.0;
float minLineSize = 41;

ArrayList<PVector> points;
ArrayList<LineSegment> lines;
Phasor anglePhasor;

class LineSegment {
  PVector v1, v2;
  int index = 0;
 
  LineSegment(float x1, float y2, float x2, float y1) {
    v1 = new PVector(x1, y2);
    v2 = new PVector(x2, y1);
  }
 
  LineSegment(PVector v1, PVector v2) {
    this.v1 = new PVector(v1.x, v1.y);
    this.v2 = new PVector(v2.x, v2.y);
  }
  
  void draw() {
    int nCircles = 22;
    
    pushStyle();
    for (int i = 0; i < nCircles; i++) {
      float amt = map(sin((anglePhasor.phase + (float) index / (float) lines.size() + (float) i / nCircles) * TWO_PI), -1.0, 1.0, 0.0, 1.0);
      float x1 = lerp(v1.x, v2.x, amt);
      float y1 = lerp(v1.y, v2.y, amt);
      noStroke();
      fill((float) index / (float) lines.size() * 255, random(255), 255);
      ellipse(x1, y1, 1.2, 1.2);
    }
    popStyle();
  }
}
 
class Phasor {
  float inc;
  float phase;
 
  Phasor(float inc) {
    this.inc = inc;
  }
 
  void update() {
    phase += inc;
 
    while (phase >= 2.0) {
      phase -= 2.0;
    }
    while (phase < 0) {
      phase += 2.0;
    }
  }
}
 
PVector getVCoordinates(PVector v, float d, float a) {
  return new PVector(v.x + d * cos(a), v.y + d * sin(a));
}
 
PVector getIntersection(LineSegment linseg1, LineSegment linseg2) {
  float x1 = linseg1.v1.x;
  float y1 = linseg1.v1.y;
  float x2 = linseg1.v2.x;
  float y2 = linseg1.v2.y;
  float x3 = linseg2.v1.x;
  float y3 = linseg2.v1.y;
  float x4 = linseg2.v2.x;
  float y4 = linseg2.v2.y;
  float d = (y4 - y3) * (x2 - x1) - (x4 - x3) * (y2 - y1);
 
  if (d == 0) {
    return null;
  }
 
  float ua = ((y4 - y3) * (x3 - x1) - (x4 - x3) * (y3 - y1)) / d;
  float ub = ((y2 - y1) * (x3 - x1) - (x2 - x1) * (y3 - y1)) / d;
 
  if (ua < 0.0 || ua > 1.0 || ub < 0.0 || ub > 1.0) {
    return null;
  }
 
  return new PVector(x1 + ua * (x2 - x1), y1 + ua * (y2 - y1));
}
  
void setup() {
  size(500, 500);
  points = new ArrayList<PVector>();
  anglePhasor = new Phasor(angleInc);
  
  for (int i = 0; i < nLines; i++) {
    points.add(new PVector(random(width), random(height), ((float) (i % nAngles) / (float) nAngles) * TWO_PI));    
  }
  makeLineSegments();
}

void draw() {
  noStroke();
  fill(0, 84);
  rect(0, 0, width, height);
  background(10);
  stroke(255, random(1.0) < 0.5 ? 0 : 255, 0, 138);

  for (LineSegment l : lines) {
    l.draw();
  }
  
  anglePhasor.update();
}

void makeLineSegments() {
  int index = 0;

  lines = new ArrayList<LineSegment>();
  lines.add(new LineSegment(0, 0, width - 1, 0));
  lines.add(new LineSegment(0, 0, 0, height - 1));
  lines.add(new LineSegment(width - 1, 0, width - 1, height - 1));
  lines.add(new LineSegment(width - 1, height - 1, 0, height - 1));
  
  for (PVector p : points) {
    PVector vCenter = new PVector(p.x, p.y);
    float a = p.z;
    PVector v1 = getVCoordinates(vCenter, width * 2, a);
    PVector v2 = getVCoordinates(vCenter, width * 2, a + PI);
    PVector startPoint = new PVector(-1, -1);
    PVector endPoint = new PVector(-1, -1);
    LineSegment t1 = new LineSegment(vCenter, v1);
    LineSegment t2 = new LineSegment(vCenter, v2);
 
    float distShortest1 = width * 4;
    float distShortest2 = width * 12;
 
    for (int i = 0; i < lines.size(); i++) {
      LineSegment L = (LineSegment) lines.get(i);
      PVector p1 = getIntersection(t1, L);
      PVector p2 = getIntersection(t2, L);
 
      if (p1 != null) {
        float distFromCenter = dist(p1.x, p1.y, vCenter.x, vCenter.y);
 
        if (distFromCenter < distShortest1) {
          distShortest1 = distFromCenter;
          startPoint = p1;
        }
      }
      else if (p2 != null) {
        float distFromCenter = dist(p2.x, p2.y, vCenter.x, vCenter.y);
 
        if (distFromCenter < distShortest2) {
          distShortest2 = distFromCenter;
          endPoint = p2;
        }
      }
    }
 
    if (dist(startPoint.x, startPoint.y, endPoint.x, endPoint.y) > minLineSize &&
        startPoint.x >= 0 && startPoint.y >= 0 && endPoint.x >= 0 && endPoint.y >= 0) {
      v1 = startPoint;
      v2 = endPoint;
      LineSegment finalLine = new LineSegment(v1, v2);
      finalLine.index = index++;
      lines.add(finalLine); 
    } 
  }
}
