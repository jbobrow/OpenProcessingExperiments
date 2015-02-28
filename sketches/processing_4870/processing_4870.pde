
Bezier bez;
Point selectedPoint;

void setup() {
  size(600, 400);
  rectMode(CENTER);
  smooth();
  strokeWeight(3);
  
  bez = new Bezier(width/2, height/2);
}

void draw() {
  background(255);
  bez.draw();
}

//=========================================
// Event Call-backs
//-----------------

void mousePressed() {
  selectedPoint = getPointUnderMouse();
}

void mouseDragged() {
  if (selectedPoint != null) {
    selectedPoint.x = mouseX;
    selectedPoint.y = mouseY;
    
    bez.recalculateCenter();
  }
}

void mouseReleased() {
  selectedPoint = null;
}


//=========================================
// Classes
//------------------

class Bezier {
  Point start;
  Point end;
  Point ctrlStart;
  Point ctrlEnd;
  Point center;
  
  Bezier(float x, float y) {
    float len = 30;
    center = new Point(x, y);
    start = new Point(x - len, y - len);
    end = new Point(x + len, y - len);
    ctrlStart = new Point(x - len, y + len);
    ctrlEnd = new Point(x + len, y + len);
    
    center.drawColor = color(0, 50);
  }
  
  void recalculateCenter() {
     // recalculate center by averaging the outer points
     center.updatePoints(averagePoint(new Point[] { start, ctrlStart, ctrlEnd, end }));
  }
  
  void draw() {
    stroke(90, 50);
    line(start.x, start.y, ctrlStart.x, ctrlStart.y);
    line(ctrlEnd.x, ctrlEnd.y, end.x, end.y);
    
    start.draw();
    ctrlStart.draw();
    ctrlEnd.draw();
    end.draw();
    center.draw();
  
    stroke(40, 100, 200);
    noFill();
    bezier(
      start.x, start.y,
      ctrlStart.x, ctrlStart.y, 
      ctrlEnd.x, ctrlEnd.y, 
      end.x, end.y);
  }
  
  Point[] getPoints() {
    return new Point[] {
      start, ctrlStart, ctrlEnd, end, center };
  }
}


class Point {
  float x, y;
  float drawSize = 26;
  color drawColor = color(204, 102, 0);

  Point(float a, float b) {
    x = a;
    y = b;
  }
  
  void draw() {
    noStroke();
    fill(this.drawColor);
    rect(x, y, drawSize/2, drawSize/2);
  }
    
  boolean hotSpotContains(float x, float y) {
    return dist(x, y, this.x, this.y) < drawSize;
  }
  
  void updatePoints (Point newPoint) {
    x = newPoint.x;
    y = newPoint.y;
  }
}


//=========================================
// Helper functions
//------------------

Point getPointUnderMouse() {
  Point[] points = bez.getPoints();
  for (int j = 0; j < points.length; j++) {
    if (points[j].hotSpotContains(mouseX, mouseY))
      return points[j];
  }
  return null;
}

Point averagePoint (Point[] points) {
  float xSum = 0;
  float ySum = 0;
  for (int i = 0; i < points.length; i++) {
    xSum += points[i].x;
    ySum += points[i].y;
  }
  return new Point(xSum/points.length, ySum/points.length);
}

