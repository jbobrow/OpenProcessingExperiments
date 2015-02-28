
class GenParticle extends Particle {

  float originX, originY;

  GenParticle(int xIn, int yIn, float vXIn, float vYIn, float r, float oX, float oY) {
    super(xIn, yIn, vXIn, vYIn, r);
    originX = oX;
    originY = oY;
  }  

  void regenerate() {
    if ((x > width + radius) || (x < -radius) || (y > height + radius) || (y < -radius)) {
       x = originX;
       y = originY;
       vX = random(-1.0, 1.0);
       vY = random(-4.0, -2.0);
    }
  }
}  


