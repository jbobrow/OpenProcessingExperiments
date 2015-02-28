
int numLevels = 200;
Branch branch1;

void setup() {
  size(600,600);
  
  Segment firstSegment = new Segment(width/2, height/2 + height/4, width/2, height/2);
  branch1 = new Branch();
  branch1.setFirstSegment(firstSegment);
}

void draw() {
  background(0);
  stroke(255,255,0);
  
  branch1.makeNewSecondSegment(mouseX, mouseY);
  branch1.calcBranch();

  branch1.getFirstSegment().draw();
  branch1.getSecondSegment().draw();
  
  noFill();
  float diameter = branch1.getFirstSegment().getLength() * 2;
  ellipse(width/2, height/2, diameter, diameter);

  stroke(255);
  drawSegments(branch1, branch1.getSecondSegment(), numLevels);
}

void drawSegments(Branch branch1, Segment lastSegment, int level) {
  Segment nextSegment = branch1.getNextSegment(lastSegment);
  nextSegment.draw();

  if (level > 0) drawSegments(branch1,nextSegment, level - 1);  
} 


class Branch {
  private float branchChangeInLength;
  private float branchChangeInAngle;

  private Segment firstSegment;
  private Segment secondSegment;

  void setFirstSegment(Segment newFirstSegment) {
    firstSegment = newFirstSegment;  
  }
  
  Segment getFirstSegment() {
    return firstSegment;  
  }
  
  Segment getSecondSegment() {
    return secondSegment;
  }

  void setSecondSegment(Segment newSecondSegment) {
    secondSegment = newSecondSegment;  
  }

  void makeNewSecondSegment(float x, float y) {
    setSecondSegment(firstSegment.makeNewSegmentTo(x,y));  
  }

  void calcBranch() {
    branchChangeInLength = secondSegment.getLength() / firstSegment.getLength();
    branchChangeInAngle = secondSegment.getAngle() - firstSegment.getAngle();
  }

  Segment getNextSegment(Segment lastSegment) {
    float newLength = lastSegment.getLength() * branchChangeInLength;
    float newAngle = lastSegment.getAngle() + branchChangeInAngle;
    float newStartX = lastSegment.endX;
    float newStartY = lastSegment.endY;
    float newEndX = newStartX + cos(newAngle) * newLength;
    float newEndY = newStartY + sin(newAngle) * newLength;

    return new Segment(newStartX, newStartY, newEndX, newEndY);
  }

}


class Segment {
  private float startX, startY, endX, endY;
  
  public Segment(float startX, float startY, float endX, float endY) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;   
  }
  
  float getLength() {
    return sqrt(sq(endX - startX) + sq(endY - startY));
  }  
  
  float getAngle() {
    return atan2(endY-startY, endX-startX);  
  }
  
  Segment makeNewSegmentTo(float x, float y) {
    return new Segment(endX, endY, x, y);  
  }
  
  void draw() {
    line(startX, startY, endX, endY);  
  }
  
}


