
// A simple Particle class

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;
  PImage b = loadImage("popcorn.gif");
  float angle;
  
  // Another constructor (the one we are using here)
  Particle(PVector l, int count) {
    acc = new PVector(0,0.8,2);
    println("Count: " + count);
    if (count > 100)
    { vel = new PVector(random(-3,3),random(-40,0),100); }
    else {
    vel = new PVector(random(-3,3),random(-20,20),100); }
    loc = l.get();
    r = 10.0;
    timer = 50.0;
  }

  void run() {
    update();
    render();
  }

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -= 1.0;
  }

  // Method to display
  void render() {
    ellipseMode(CENTER);
    stroke(255,timer);
    fill(100,timer);
    float jitter = random(-0.1, 0.1);
    image(b,loc.x,loc.y);
  //  displayVector(vel,loc.x,loc.y,10);
  }
  
  // Is the particle still useful?
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
  
   void displayVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 4;
    // Translate to location to render vector
    translate(x,y);
    stroke(255);
    // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(0,0,len,0);
    line(len,0,len-arrowsize,+arrowsize/2);
    line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
  } 

}


