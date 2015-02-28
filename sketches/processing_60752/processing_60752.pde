
class Segment {
  Segment parent = null;
  ArrayList<Segment> children = new ArrayList<Segment>();
  float phi, len, thick;
  
  Segment(float phi, float len, float thick) {
    this.phi = phi;
    this.len = len;
    this.thick = thick;
  }
  
  void addChild(Segment child) {
    children.add(child);
  }
  
  void setParent(Segment s) {
    this.parent = s;
  }
  
  void display() {
    rect(-thick*0.5,-len,thick,len);
  }
}

