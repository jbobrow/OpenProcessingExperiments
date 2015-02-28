
class Particle extends VerletParticle {

  float w,h;
  boolean dragging = false;

  Particle(float x_, float y_, float z_, float w_, float h_) {
    super(x_, y_, z_);
    w = w_;
    h = h_;  
  }
  
  void update() {
    if (dragging) {
      x = mouseX;
      y = mouseY;
    }  
  }
  
  void display() {
    fill(175);
    stroke(0);
    ellipse(x,y,w,h);  
  }
  
  // The methods below are for mouse interaction
  
  // This checks to see if we clicked on the pendulum ball
  void clicked(int mx, int my) {
    println("clicked!");
    float d = dist(mx,my,x,y);
    if (d < w) {
      dragging = true;
    }
  }

  // This tells us we are not longer clicking on the ball
  void stopDragging() {
    dragging = false;
  }
  
}

