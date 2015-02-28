
import peasy.*; 
PeasyCam cam;

void setup() { 
  size(800, 600, P3D);
  
  noStroke();
  cam = new PeasyCam(this, width);
  
}

float phi = (1 + sqrt(5))/2.0;

class ThreeDIcosahedron {
  PVector[] points;
  
  ThreeDIcosahedron() {
    buildPoints();
  }
  
  void buildPoints() {
    points    = new PVector[12];
    
    points[0] = new PVector(0, 1, phi);
    points[1] = new PVector(0, 1, -phi);
    points[2] = new PVector(0, -1, -phi);
    points[3] = new PVector(0, -1, phi);
    
    points[4] = new PVector(1, phi, 0);
    points[5] = new PVector(1, -phi, 0);
    points[6] = new PVector(-1, -phi, 0);
    points[7] = new PVector(-1, phi, 0);
    
    points[8]  = new PVector(phi, 0, 1);
    points[9]  = new PVector(phi, 0, -1);
    points[10] = new PVector(-phi, 0, -1);
    points[11] = new PVector(-phi, 0, 1);
  }
  
  void fillRectangles() {
    fill(0, 255, 0, 255);
    stroke(0, 255, 0, 255);    
    beginShape();
    plotVertex(points[0]);
    plotVertex(points[1]);
    plotVertex(points[2]);
    plotVertex(points[3]);    
    endShape(CLOSE);
    
    beginShape();
    plotVertex(points[4]);
    plotVertex(points[5]);
    plotVertex(points[6]);
    plotVertex(points[7]);    
    endShape(CLOSE);
    
    beginShape();
    plotVertex(points[8]);
    plotVertex(points[9]);
    plotVertex(points[10]);
    plotVertex(points[11]);    
    endShape(CLOSE);    
  }
  
  void plotVertex(PVector vector) {
    vertex(vector.x, vector.y, vector.z);
  }
  
  void drawLinesFor(int i) {
    PVector myPoint = this.points[i];
    // Flip the sign of 1
    PVector otherPoint = flipSignOf(myPoint, 1);
    drawLine(myPoint, otherPoint);
    
    // Rotate left and flip 1
    otherPoint = rotateLeft(myPoint);
    drawLine(myPoint, otherPoint);
    otherPoint = flipSignOf(otherPoint, 1);
    drawLine(myPoint, otherPoint);
    
    // Rotate right and flip phi
    otherPoint = rotateRight(myPoint);
    drawLine(myPoint, otherPoint);
    otherPoint = flipSignOf(otherPoint, phi);
    drawLine(myPoint, otherPoint);    
  }
  
  void drawLines() {
//    drawLinesFor(7);
    for (int i = 0; i < this.points.length; i++) {
      drawLinesFor(i);
    }
  }
  
  void drawLine(PVector myPoint, PVector otherPoint) {
    stroke(0, 0, 255, 255);
    line(myPoint.x, myPoint.y, myPoint.z, otherPoint.x, otherPoint.y, otherPoint.z);    
  }
  
  PVector flipSignOf(PVector vector, float value) {
    if (vector.x == value || vector.x == -value)
      return new PVector(-vector.x, vector.y, vector.z);
    else if (vector.y == value || vector.y == -value)
      return new PVector(vector.x, -vector.y, vector.z);
    else if (vector.z == value || vector.z == -value)
      return new PVector(vector.x, vector.y, -vector.z);
    else       
      return new PVector(999, 999, 999);
  }  
  
  PVector rotateLeft(PVector vector) {
    if (signCount(vector) == 1)
      return new PVector(-vector.y, -vector.z, -vector.x);
    else
      return new PVector(vector.y, vector.z, vector.x);
  }
  
  PVector rotateRight(PVector vector) {
    if (signCount(vector) == 1)
      return new PVector(-vector.z, -vector.x, -vector.y);
    else
      return new PVector(vector.z, vector.x, vector.y);
  }
  
  int signCount(PVector vector) {
    int count = 0;
    if (vector.x < 0)
      count += 1;
    if (vector.y < 0)
      count += 1;
    if (vector.z < 0)
      count += 1;
    return count;      
  }
}

void draw() {
  background(15, 15, 15);
  noFill();
  
  ThreeDIcosahedron icosa = new ThreeDIcosahedron();
  icosa.drawLines();
//  icosa.fillRectangles();
}

