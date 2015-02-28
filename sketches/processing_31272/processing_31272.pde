
class AttractionPoint extends PVector {
  
  int radius = 5;
  int closestSegment;
  
  public AttractionPoint(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  public AttractionPoint(PVector p) {
    this.x = p.x;
    this.y = p.y;
    this.z = p.z;
  }
  
  public AttractionPoint(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public int getClosestSegmentIndex() {
    return closestSegment;
  }
  
  public void draw() {
    noStroke();
    fill(0,200,0);
    ellipseMode(CENTER_RADIUS);
    pushMatrix();
    translate(this.x-width/2,this.y-height/2,this.z);
    if(drawAttractors)
      box(radius);
    popMatrix();
  }
  
}

