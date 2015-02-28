
// http://en.wikipedia.org/wiki/Sutherland%E2%80%93Hodgman
int stage;
int clipstep;
ClipShape shape;
ClipWindow window;
Clipper clipper;

void setup() {
  size(300,300);
  stage = 0;
  clipstep = 0;
  shape = new ClipShape();
  window = new ClipWindow();
  background(204);
}

void draw() {
  background(204);
  stroke(63);
  strokeWeight(2);
  fill(127);
  if (stage == 0) {
    shape.draw(false);
  }
  if (stage == 1) {
    shape.draw(true);
    window.draw(false);
  }
  if (stage > 1) {
    shape.draw(true);
    clipper.draw(clipstep);
  }
}
void mousePressed() {
  if (stage == 0) {
    shape.addPoint(mouseX,mouseY);
  }
  if (stage == 1) {
    window.addPoint(mouseX,mouseY);
  }
  if (stage > 1) {
    clipstep++;
  }
}
void keyPressed() {
  if (key == ' ') {
    if (stage == 0 && shape.size() > 2) {
      stage++;
    }
    if (stage == 1 && window.size() > 2) {
      clipper = new Clipper(window);
      stage++;
    }
  }
  if (key == 'R' || key == 'r') {
    setup();
  }
}

class ClipShape {
  private ArrayList<PVector> vertices;
  
  public ClipShape() {
    vertices = new ArrayList<PVector>();
  }
  public ClipShape(ArrayList<PVector> points) {
    vertices = new ArrayList<PVector>(points);
  }
  public void addPoint(int x, int y) {
    addPoint(new PVector(x,y));
  }
  public void addPoint(PVector p) {
    vertices.add(p);
  }
  public int size() {
    return vertices.size();
  }
  public void draw(boolean fill) {
    strokeWeight(2);
    stroke(0);
    fill(0,95,0,95);
    beginShape();
    for (PVector p: vertices) {
      vertex(p.x,p.y);
    }
    if (fill) {
      endShape(CLOSE);
    } else {
      endShape();
    }
  }
}

class ClipWindow {
  private ArrayList<PVector> vertices;
  
  public ClipWindow() {
    vertices = new ArrayList<PVector>();
  }
  public void addPoint(PVector l) {
    if (convex(l)) {
      vertices.add(l);
    }
  }
  public void addPoint(int x, int y) {
    addPoint(new PVector(x,y));
  }
  public int size() {
    return vertices.size();
  }
  private boolean convex(PVector p) {
    if (vertices.size() <3) {
      return true;
    }
    /*
      f point: first
      s point: second
      n point: next to last
      l point: last
      p point: new
      
      a line: s-f
      b line: l-n
      c line: l-f
      
      q line: p-f
      r line: p-l
      
      if p is on the same side of c as n
           return false
      if p is on the same side of a as l, and
         p is on the same side of b as f
           return true
        
    */
    PVector f = vertices.get(0);
    PVector s = vertices.get(1);
    PVector n = vertices.get(vertices.size()-2);
    PVector l = vertices.get(vertices.size()-1);
    
    PVector a = s.get();  a.sub(f);
    PVector c = l.get();  c.sub(f);
    PVector q = p.get();  q.sub(f);
    PVector r = p.get();  r.sub(l);
    PVector b = l.get();  b.sub(n);
    PVector cxr = c.cross(r); //p first last
    PVector cxb = c.cross(b); //n first last
    if (cxr.z*cxb.z<0) {
      return false;
    }
    PVector axq = a.cross(q);
    PVector axc = a.cross(c);
    boolean qc = axq.z*axc.z>0;
    
    PVector bxr = b.cross(r);
    PVector bxc = b.cross(c);
    boolean rc = bxr.z*axc.z>0;
    return qc && rc;
  }
  public void draw(boolean fill) {
    strokeWeight(2);
    stroke(0);
    fill(0,0,95,95);
    beginShape();
    for (PVector p: vertices) {
      vertex(p.x,p.y);
    }
    if (fill) {
      endShape(CLOSE);
    } else {
      endShape();
    }
  }
  public ArrayList<PVector> points() {
    return new ArrayList<PVector>(vertices);
  }
  public boolean ccw() {
    ArrayList<PVector> v = new ArrayList<PVector>(vertices);
    try {
      v.add(v.get(0));
    } catch (Exception idontcarewhatthisiscalledsoillmakeareallylongname) {
      return false;
    }
    int sum = 0;
    for (int i = 0; i+1 < v.size(); i++) {
      PVector p1 = v.get(i);
      PVector p2 = v.get(i+1);
      sum += (p2.x-p1.x)*(p2.y+p1.y);
    }
    return sum > 0;
  }
}

class Clipper {
  private ClipWindow mywindow;

  public Clipper(ClipWindow clipwindow) {
    mywindow = clipwindow;
  }
  public void draw(int s) {
    boolean counterclockwise = mywindow.ccw();
    ArrayList<PVector> mypoints = new ArrayList<PVector>(mywindow.points());
    if (s > mypoints.size()) {
      s = mypoints.size();
    }
    if (s < mypoints.size()) {
      mywindow.draw(true);
    }
    if (s < 1) {
      return;
    }
    mypoints.add(mypoints.get(0));
    rectMode(CORNER);
    noStroke();
    fill(204);
    for (int i = 0; i < s; i++) {
      PVector p1 = mypoints.get(i);
      PVector p = new PVector(p1.x,p1.y);
      PVector p2 = mypoints.get(i+1);
      p.sub(p2);
      double th = atan2(p.y, p.x);
      pushMatrix();
      translate(p1.x, p1.y);
      rotate((float)th);
      if (counterclockwise) {
        rotate(PI);
      }
      rect(0-width, 0, 2*width, 2*height);
      popMatrix();
    }
  }
}

