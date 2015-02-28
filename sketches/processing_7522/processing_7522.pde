
class Particle
{
  PVector pos;
  PVector vel;
  Particle()
  {
    pos = new PVector( random(0,width), random(0,height) );
    vel = new PVector( random(-1,1), random(-1,1) );
  }
  void react(Particle [] chain)
  {
    for (int i = 0; i < chain.length; i++) {
      if (chain[i] != this) {
        float d = PVector.dist( pos, chain[i].pos );
        // force on a spring F = kx is proportional to its displacement from equilibrium
        // our spring has an equilibrium position of 100 units length
        float x = d - 100.0;
        PVector dir = PVector.sub( chain[i].pos, pos );
        dir.normalize();
        // next step in symbols:
        // F = ma -> ma = kx -> dv/dt = kx/m -> dv = kx/m dt
        // i.e., in a short space of time, there's a small change in velocity
        // due to the spring's displacement from equilibrium, x. 
        // Much more simply:
        dir.mult( x / 1000.0 );
        //
        vel.add(dir);
      }
    }
    //
    bounce();
    // friction: slow to equilibrium
    vel.mult(0.98);
  }
  void move()
  {
    pos.add(vel); 
  }
  void draw()
  {
    ellipse( pos.x, pos.y, 20, 20 ); 
  }
  void bounce()
  {
    if ((pos.x < 10 && vel.x < 0) || (pos.x > width - 10 && vel.x > 0)) {
      vel.x = -vel.x * 0.95; // non-elastic bounces: some energy lost to the wall
    }
    if ((pos.y < 10 && vel.y < 0) || (pos.y > height - 10 && vel.y > 0)) {
      vel.y = -vel.y * 0.95; // non-elastic bounces: some energy lost to the wall
    }
  }
  void jiggle()
  {
    vel = new PVector( random(-10,10), random(-10,10) );    
  }
}


