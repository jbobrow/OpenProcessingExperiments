
class Element {
  PVector loc = new PVector();
  PVector acc = new PVector();
  PVector vel = new PVector();
  World parent;
  boolean colliding = false;

  int id = millis();

  Element(World parent) {
    this.parent = parent;
  }

  Element(World parent, PVector loc) {
    this.loc = loc; 
    this.parent = parent;
  }

  void update() {
    if (loc.z >= 100.0) {
      acc.z = -acc.z;
      loc.z = 99.0;
         vel.z = 0;
    } else if(loc.z <= -100.0) {
     acc.z = -acc.z;
    loc.z = -99.0;
   vel.z = 0; 
    }
   
   
    vel.add(acc);
    loc.add(vel);
    

  }

  float mass = 32.0;

  void render() {
    PVector isoloc = parent.getScreenPosition(loc);
    if (colliding) {
      fill(255, 0, 0);
    } 
    else {
      fill(255, 0, 255);
    }
    
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
    //ellipse(isoloc.x, isoloc.y- isoloc.z, mass, mass);
  }

}


