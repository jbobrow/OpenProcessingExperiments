
// A simple Particle class

class Particle {
  static final int MAX_BOUNCES = 5;
  
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float len;
  boolean mustDie;
  float partColor;
  float partAlpha;
  int bounces;
  
  // Another constructor (the one we are using here)
  Particle(PVector l) {
    acc = new PVector(0,0.05);
    vel = new PVector(random(-0.5,0.5),random(0,0));
    loc = l.get();
    r = 10.0;
    len = random(5, 9);
    mustDie = false;
    partAlpha = random(140, 240);
    partColor = random(100, 200);
    bounces = 0;
  }

  void run(PImage frame) {
    update(frame);
    render();
  }

  // Method to update location
  void update(PImage frame)
  {
    //Double threshold filter. Could be optimized using a b/w mask precalculated
    float nextX = loc.x + vel.x;
    float nextY = loc.y + vel.y;
    float curr = brightness(frame.get((int) nextX, (int) nextY));
    //if (curr > 200 || curr < 30)
    //if (curr < 10.0)
    //  mustDie = true;
    if (curr < 40.0 && nextY < height - 2)
    {
      bounces++;
      len /= random(1, 1.6);
      partAlpha /= 1.15;
      partColor *= 1.15;
      vel.mult(random(-0.3, -0.9));
      vel.x += random(-1, 1);
      vel.y += random(-1, 1);
    }
    
    //Update physics
    vel.add(acc);
    loc.add(vel);
  }

  // Method to display
  void render()
  {
    PVector dir = vel.get();
    dir.normalize();
    dir.mult(len);
    
    stroke(partColor, partAlpha);
    smooth();
    line(loc.x, loc.y, loc.x-dir.x, loc.y-dir.y);
  }
  
  // Is the particle still useful?
  boolean dead()
  {
    if (mustDie
        || bounces > MAX_BOUNCES
        || loc.y > height
        || loc.x < 0
        || loc.x > width)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
   /*void displayVector(PVector v, float x, float y, float scayl) {
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
  } */
}


