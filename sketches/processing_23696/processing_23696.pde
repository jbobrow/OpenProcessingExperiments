
// Arrive
// Credits: Daniel Shiffman <http://www.shiffman.net>

class Boid {

  PVector loc, vel, acc;
  float r, maxforce, maxspeed;
  boolean arrived;
  int c;

  Boid(PVector l, float ms, float mf, int c, boolean arrived) {
      float q = onionData.getMedHi()*onionData.getParam1();
    acc = new PVector(0,0);
    vel = new PVector(0,0);
    loc = l.get();
    r = 4;
    maxspeed = ms;
    maxforce = mf;
    this.c=c;
    this.arrived = arrived;
  }

  // Method to update location
  void update() {
    // Update velocity
    vel.add(acc);
    // Limit speed
    vel.limit(maxspeed);
    loc.add(vel);
    // Reset accelertion to 0 each cycle
    acc.mult(0);
  }

  void arrive(PVector target) {
    acc.add(steer(target,true));
  }

  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  PVector steer(PVector target, boolean slowdown) {
    PVector steer;  // The steering vector
    PVector desired = PVector.sub(target,loc);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0f)) desired.mult(maxspeed*(d/100.0f)); // This damping is somewhat arbitrary
      else desired.mult(maxspeed);
      // Steering = Desired minus Velocity
      steer = PVector.sub(desired,vel);
      steer.limit(maxforce);  // Limit to maximum steering force
    } 
    else {
      steer = new PVector(0,0);
    }
    return steer;
  }
}

class Point {
  float x, y, z;
  boolean arrived;

  Point(float x, float y, boolean arrived) {
    this.arrived = arrived;
    this.x = x;
    this.y = y;
  }
}

// ImgProc by Marcin Ignac
// http://www.marcinignac.com/

public class ImgProc {

  void ImgProc() {
  }

  void drawPixelArray(int[] src, int dx, int dy, int w, int h) {  
    loadPixels();
    int x;
    int y;
    for(int i=0; i<w*h; i++) {
      x = dx + i % w;
      y = dy + i / w;
      pixels[x  + y * w] = src[i];
    }
    updatePixels();
  }

  void blur(int[] src, int[] dst, int w, float h) {
    int c;
    int r;
    int g;
    int b;

    for(int y=1; y<h-1; y++) {
      for(int x=1; x<w-1; x++) {      
        r = 0;
        g = 0;
        b = 0;
        for(int yb=-1; yb<=1; yb++) {
          for(int xb=-1; xb<=1; xb++) {
            c = src[(x+xb)+(y-yb)*w];      
            r += (c >> 16) & 0xFF;
            g += (c >> 8) & 0xFF;
            b += (c) & 0xFF;
          }
        }      
        r /= 10;
        g /= 10;
        b /= 10;
        dst[x + y*w] = 0xFF000000 | (r << 16) | (g << 8) | b;
      }
    }
  }
}


