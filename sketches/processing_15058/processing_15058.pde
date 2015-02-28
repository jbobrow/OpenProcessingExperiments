
class Unit 
{
  ParticleSystem physics;

  float diamPart = 0;
  float diamOrb = 200;
  int numPart = 1;
  int attractionStrength = 5;
  float attractionMin = 1;

  float turn;
  float angle;
  float bounceDamp = 0.5;
  color c;
  int a;
  int r;
  int g;
  int b;

  int x;
  int y;
  int z;
 

  
  Unit(float rTemp, float gTemp, float bTemp, float aTemp, int xTemp, int yTemp, int zTemp)
  {
  
   x = xTemp;
   y = yTemp;
   z = zTemp;
   c= color (rTemp, gTemp, bTemp, aTemp);

  } 
  
  void start ()
  {
    physics = new ParticleSystem( 0, 0, 0, 0.01 );
    for ( int i = 0; i < numPart; i++ )
    {
      Particle p = physics.makeParticle( 0.01, x,y,z);
   
    
//     for ( int j = 0; j < i; j++ )
//      {
//        Particle q = physics.getParticle( j );
//        physics.makeAttraction( p, q, attractionStrength, attractionMin );
//      }
    }
  }
  void move()
  {
    physics.tick();
  }
  void rotating(float turnTemp)
  {
    turn = turnTemp/4;
    if (second() % 1 == 0) {
    angle += turn;
    }
    rotateX( angle );
    rotateY( angle );
  }
  void drawPart()
  {
    noFill();
    //fill(255);
   // noStroke();
    //smooth();
    stroke( color (c) );
   // strokeWeight(5);
    for ( int i = 0; i < numPart; i++ )
    {
      pushMatrix();
      Particle p = physics.getParticle( i );

      translate( p.position().x(), p.position().y(), p.position().z() );
     // line(p.position().x(), p.position().y(), p.velocity().x(),p.velocity().y() );
      sphere(diamPart);
      popMatrix();
    }
  }

  void grow()
  {
   diamPart += .2;
   diamOrb +=6;

  
   
    
   if (diamPart >= 1000){
     diamPart = 0; 
     } 
  }
}


