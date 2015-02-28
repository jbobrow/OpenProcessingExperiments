
class Particle {

  PVector p;
  float step, angle;


  Particle()
  {
    p = new PVector( random( width ), random( height ), 0 );
    step = random( 1, 10 );
    angle = 0.0;
  }


  void draw()
  {
    fill( 51, alphaParticle );
    ellipse( p.x, p.y, 2, 2 );
  }

}

