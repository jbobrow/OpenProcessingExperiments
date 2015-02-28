
class Forcepoint {
  PVector loc;
  PVector force;

  void setForce(PVector f) {
    force.set(f);
  }

  Forcepoint(PVector spawnLoc) {
    loc = new PVector();
    force = new PVector();

    loc.set(spawnLoc);
  }


  void render() {
    ellipseMode(CENTER);
    stroke(255, 0, 0);
    fill(100);
    ellipse(loc.x, loc.y, 2, 2);
    displayVector(force, loc.x, loc.y, 2000);
  }

  void displayVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 5;
    // Translate to location to render vector
    translate(x,y);
    strokeWeight(0.2);
    stroke(255, 255, 0, 50);
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


