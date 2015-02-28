
float firstSegmentLength;
int numLevels = 6;

long numCalls = 0;

Branch branch1;
Branch branch2;

void setup() {
  size(600,600);

  Segment firstSegment = new Segment(width/2, height/2 + height/4, width/2, height/2);
  firstSegmentLength = firstSegment.getLength();
  branch1 = new Branch();
  branch1.setFirstSegment(firstSegment);
  branch2 = new Branch();
  branch2.setFirstSegment(firstSegment);
}

void draw() {
  background(0);

  branch1.makeNewSecondSegment(mouseX, mouseY);
  branch1.calcBranch();

  branch2.makeNewSecondSegment(width - mouseX, mouseY);
  branch2.calcBranch();

  color c = color(255,255,0);
  fill(c); 
  stroke(c);
  branch1.drawGeneratingSegments();
  branch2.drawGeneratingSegments();

  numCalls = 0;

  noFill();
  ellipse(width/2, height/2, firstSegmentLength*2, firstSegmentLength*2);
  stroke(255);
  drawTree(branch1, branch2, branch1.getSecondSegment(), numLevels);
  //drawTree(branch1, branch2, branch1.getSecondSegment(), numLevels);
  drawSegments(branch2, branch2.getSecondSegment(), numLevels);

  println("Num Calls: " + numCalls);
}

void drawSegments(Branch branch1, Segment lastSegment, int level) {
  numCalls += 1;
  Segment nextSegment = branch1.getNextSegment(lastSegment);
  nextSegment.draw();

  if (nextSegment.getLength()<1) return;
  if (level > 0) drawSegments(branch1, nextSegment, level - 1);  
} 

void drawTree(Branch branch1, Branch branch2, Segment lastSegment, int level) {
  Segment nextSegment;
 
  nextSegment = branch1.getNextSegment(lastSegment);
  nextSegment.draw();
  
  if (level > 0) drawTree(branch1, branch2, nextSegment, level - 1);  

  nextSegment = branch2.getNextSegment(lastSegment);
  nextSegment.draw();
  if (level > 0) drawTree(branch1, branch2, nextSegment, level - 1);  
  //What do we need to do here?
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

  void drawGeneratingSegments() {
    firstSegment.draw();
    secondSegment.draw();  
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
    float f = height/16/getLength();
    f = constrain(f, 0.0, 1.0);
    stroke((1-f)*255, (f)*255 + (1-f)*255, 0);
    line(startX, startY, endX, endY);  
  }
  
}


