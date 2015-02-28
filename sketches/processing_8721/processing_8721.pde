
class Element implements Comparable {
  PVector loc = new PVector();
  PVector acc = new PVector();
  PVector vel = new PVector();
  World parent;
  boolean colliding = false;


  int[] lastScreenPosition = new int[4]; //x, y, width, height

  int id = millis();

  Element(World parent) {
    this.parent = parent;
  }

  Element(World parent, PVector loc) {
    this.loc = loc; 
    this.parent = parent;
  }

  void update() {


    if (focused)
    acc.z = -0.4;

    vel.add(acc);
    loc.add(vel);


    if (loc.z < -1000.0) {
      loc = new PVector(loc.x, loc.y, 0);
      acc = new PVector();
      vel = new PVector();
    }

  }

  float mass = 32.0;
boolean focused = false;
  void render() {
    PVector isoloc = parent.getScreenPosition(loc);
    if (colliding) {
      fill(255, 0, 0);
    } 
    else {
      fill(255, 0, 255);
    }
    
    if (focused)
      fill(0, 255, 0);

    int mx = int(mass / 2.0);
    int my = int(mass / 4.0);

    int centerX = int(isoloc.x);
    int centerY = int(isoloc.y - loc.z);

    pushMatrix();
    translate(centerX, centerY);


    int ax = -mx;
    int ay = 0;

    int bx = 0;
    int by = - my;

    int cx = mx;
    int cy = 0;

    int dx = 0;
    int dy = my;

    quad(ax, ay, bx, by, cx, cy, dx, dy);

    fill(255, 128, 0);
    quad(ax, ay,dx, dy, dx, dy + mx, ax, ay + mx);


    fill(255, 255, 0);
    quad(dx, dy, cx, cy, cx, cy + mx, dx, dy + mx);

    popMatrix();
    
    lastScreenPosition[0] = ax + centerX;
    lastScreenPosition[1] = by + centerY;
    lastScreenPosition[2] = lastScreenPosition[0] + int(mass);
    lastScreenPosition[3] = lastScreenPosition[1] + int(mass);
    
    stroke(255, 30);
    fill(255, 0);
    rect(lastScreenPosition[0], lastScreenPosition[1], mass, mass);
    
    //ellipse(isoloc.x, isoloc.y- isoloc.z, mass, mass);
  }

  int compareTo(Object o) {
    Element other = (Element) o;

    if (loc.y < other.loc.y) {
      return -1; 
    } 
    else if (loc.y > other.loc.y) {
      return 1; 
    } 
    else {
      if (loc.x < other.loc.x) {
        return -1;
      } 
      else if (loc.x > other.loc.x) {
        return 1;
      } 
      else {
        if (loc.z < other.loc.z) {
          return -1;
        } 
        else if (loc.z > other.loc.z) {
          return 1;
        } 
        else {
          return 0; 
        }
      }
    }

  }

}



