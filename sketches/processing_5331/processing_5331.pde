

class Circle {
  float radius;
  float iters;
  float angle;
  float displace;  
  
  Circle(float radius, float iters, float angle, float displace) {
    this.radius   = radius;
    this.iters    = iters;
    this.angle    = angle;
    this.displace = displace;
  }
  
  float x(float t) { return 0; }
  float y(float t) { return 0; }
  float z(float t) { return 0; }  
  
  void lineStroke(float t) {
//    if (i % 25 == 0) {
      stroke(0, 255, 0, 100);
//    } else {
//      stroke(0, 255, 0, 100);
//    }            
  }
    
  void drawShape() {    
    noFill();    
    beginShape();
    PVector[] points = pointDecompose((int) iters);    
    for (int i = 0; i < points.length; i++) {
      lineStroke(i);
      vertex(points[i].x, points[i].y, points[i].z);
    }
    endShape(CLOSE);     
  }
  
  void drawPoints() {
    PVector[] points = pointDecompose((int) iters);
    pushMatrix();
    for (int i = 0; i < points.length; i++) {
      if (i % 10 == 0) {
        stroke(0, 255, 0, 255);
        point(points[i].x, points[i].y, points[i].z);
      }
    }
    popMatrix();
  }
  
  PVector[] pointDecompose(int count) {
    PVector[] points = new PVector[count];
    for (int i = 0; i < count; i++) {
      float t = TWO_PI*(i/float(count));
      points[i] = new PVector(x(t), y(t), z(t));
    }
    return points;
  }
}

