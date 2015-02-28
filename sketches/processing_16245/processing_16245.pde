
// Attraction
// Daniel Shiffman <http://www.shiffman.net>

// A class for a draggable attractive body in our world

class Attractor {
  float mass;    // Mass, tied to size
  float G;       // Gravitational Constant
  PVector loc;   // Location
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  PVector drag;  // holds the offset for when object is clicked on

  Attractor(PVector l_,float m_, float g_) {
    loc = l_.get();
    mass = m_;
    G = g_;
    drag = new PVector(0.0,0.0);
  }

  void go() {
    render();
    drag();
  }
 
  PVector calcGravForce(Thing t) {
    PVector dir = PVector.sub(loc,t.getLoc());        // Calculate direction of force
    float d = dir.mag();                              // Distance between objects
    d = constrain(d,5.0,25.0);                        // Limiting the distance to eliminate "extreme" results for very close or very far objects
    dir.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float aforce = (G * mass * t.getMass()) / (d * d); // Calculate gravitional force magnitude
    dir.mult(aforce);                                  // Get force vector --> magnitude * direction
    return dir;
  }

  // Method to display
  void render() {
    if (showAttractor) {
    noStroke();
   { 
    ellipseMode(CENTER);
    if (dragging) fill (50);
    else if (rollover) fill(100);
    else fill(175,200);
    ellipse(loc.x,loc.y,40,40);
   }
    fill (255, 100);
    rect (loc.x , loc.y, 2, 10);
    rect (loc.x , loc.y, 10, 2);
  }
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
    if (d < 20) {
      rollover = true;
    } else {
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


