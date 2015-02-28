
class Attractor {
  float mass;    // Mass, tied to size
  float G;       // Gravitational Constant
  private PVector loc;   // Location
  private PVector vel;
  private PVector acc;
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  PVector drag;  // holds the offset for when object is clicked on
  private float bounce = 1.0f;
  private int c, id;
  //boolean left = false;
  //boolean move = false;

  Attractor(PVector l_,float m_, float g_, PVector a_, PVector v_, int c_) {
    loc = l_.get();
    acc = a_.get();
    vel = v_.get();
    mass = m_;
    G = g_;
    drag = new PVector(0.0,0.0);
    c = c_; //fill color
  }

  Attractor(PVector l_,float m_, PVector a_, PVector v_, int c_, int id_) {
    loc = l_.get();
    acc = a_.get();
    vel = v_.get();
    mass = m_;
    //G = g_;
    drag = new PVector(0.0,0.0);
    c = c_; //fill color
    id = id_;
  }

  void go() {
    update();
    borders();
    render();
    drag();
  }


  void update() {
    vel.add(acc);
    vel.limit(20);
    loc.add(vel);
    acc.mult(0);

    //change G based on loc.x
    if (id == 1) {
      G = map(loc.x, 640, 1280, 30.0, 1.0);
    } 
    else if (id == 2) {
      G = map(loc.x, 0, 640, 30.0, 1.0);
    }
  }

  //external access to gravity intensity
  void setGravity(float gIn) {
    if (gIn > 0.0 & gIn < 10) {
      G = gIn;
    }
  }

  void borders() {

    if (loc.x >= 1280) {
      vel.x *= -bounce;
    }   

    if (loc.x <= 0) {
      vel.x *= -bounce;
    }
  }

  PVector calcGravForce(Thing t) {
    PVector dir = PVector.sub(loc, t.getLoc());        // Calculate direction of force
    float d = dir.mag();                              // Distance between objects
    d = constrain(d,5.0,25.0);                        // Limiting the distance to eliminate "extreme" results for very close or very far objects
    dir.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float force = (G * mass * t.getMass()) / (d * d); // Calculate gravitional force magnitude
    dir.mult(force);                                  // Get force vector --> magnitude * direction
    return dir;
  }
  
  PVector calcGravForce(Thing2 t) {
    PVector dir = PVector.sub(loc, t.getLoc());        // Calculate direction of force
    float d = dir.mag();                              // Distance between objects
    d = constrain(d,5.0,25.0);                        // Limiting the distance to eliminate "extreme" results for very close or very far objects
    dir.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float force = (G * mass * t.getMass()) / (d * d); // Calculate gravitional force magnitude
    dir.mult(force);                                  // Get force vector --> magnitude * direction
    return dir;
  }

  // Method to display
  void render() {
    ellipseMode(CENTER);
    noStroke();
    if (dragging) fill (200,50,10);
    else if (rollover) fill(255);
    else fill(c,200);
    ellipse(loc.x,loc.y,mass*2,mass*2);
  }

  // The methods below are for mouse interaction
  void clicked(int mx, int my) {
    float d = dist(mx,my,loc.x,loc.y);
    if (d < mass) {
      dragging = true;
      drag.x = loc.x-mx;
      drag.y = loc.y-my;
    }
  }

  void rollover(int mx, int my) {
    float d = dist(mx,my,loc.x,loc.y);
    if (d < mass) {
      rollover = true;
    } 
    else {
      rollover = false;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag() {
    if (dragging) {
      loc.x = mouseX + drag.x;
      loc.y = mouseY + drag.y;
    }
  }
}


