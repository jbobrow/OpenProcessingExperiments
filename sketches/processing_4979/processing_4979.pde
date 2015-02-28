
class GenParticle extends Particle {
  float originX, originY;
  
  // CONSTRUCTOR START ------------------------------------------------------------------------
  GenParticle(int xIn, int yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r);
    originX = ox;
    originY = oy;
  }
  // CONSTRUCTOR END --------------------------------------------------------------------------
  
  void regenerate() {
    if ((x > width+radius) || (x < -radius) || (y > height+radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-1.0, 1.0);
      vy = random(-4.0, -2.0);
    }
  }
}


