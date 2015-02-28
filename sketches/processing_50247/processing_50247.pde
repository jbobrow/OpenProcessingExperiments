
import traer.physics.*;

Particle mouse, b, c;
ParticleSystem physics;

float pastXb;
float pastYb;

float pastXc;
float pastYc;

float gravityb = 10;
float gravityc = 10;

float gravityFactor = .5;

void setup()
{
  size( 900, 900 );
  frameRate( 60 );
  smooth();
  ellipseMode( CENTER );
  noStroke();
  noCursor();
  background (0);

  physics = new ParticleSystem();
  mouse = physics.makeParticle();
  mouse.makeFixed();
  b = physics.makeParticle( (random(100)/20), 0, 0, 0 );
  b.velocity().add( (random(100)/100), (random(100)/25), 0 );
  c = physics.makeParticle( (random(100)/20), width, height, 0 );

  //physics.makeAttraction( mouse, b, 2000, 10 );
  //physics.makeAttraction( mouse, c, 5000, 10 );
  physics.makeAttraction( b, c, 5, 5 );

  c.velocity().add( -1*(random(100)/100), -1*(random(100)/25), 0 );
}

void draw()
{

  physics.makeAttraction( mouse, b, gravityb, 1000 );
  physics.makeAttraction( mouse, c, gravityc, 1000 );
  mouse.position().set( width/2, height/2, 0 );
  //handleBoundaryCollisions( b );


  //handleBoundaryCollisions( c );

  fill(0, 0, 0, 4);
  stroke(0, 0, 0, 4);
  rect( 0, 0, width, height);

  stroke( 0, 0, 255);
  noFill();
  //ellipse( mouse.position().x(), mouse.position().y(), 35, 35 );

  fill( 0 );
  //ellipse( b.position().x(), b.position().y(), 5, 5 );
  pastXb = b.position().x();
  pastYb = b.position().y();

  pastXc = c.position().x();
  pastYc = c.position().y();

  float distance1b = whatDist(width/2, pastXb, height/2, pastYb);
  float distance1c = whatDist(width/2, pastXc, height/2, pastYc);

  physics.tick(1);

  float distance2b = whatDist(width/2, b.position().x(), height/2, b.position().y());
  float distance2c = whatDist(width/2, c.position().x(), height/2, c.position().y());

  strokeWeight(1);
  //point(b.position().x(), b.position().y());
  //point(b.position().x(), b.position().y());
  //point(b.position().x(), b.position().y());
  line( pastXb, pastYb, b.position().x(), b.position().y());
  stroke( 255, 0, 0 );
  line( pastXc, pastYc, c.position().x(), c.position().y());


  float distDiffb = (distance2b - distance1b); 
  float distDiffc = (distance2c - distance1c); 


 
  if (distDiffb > 0) {
    gravityb *= 1.01;
  }
  else {
    gravityb *= .99;
  }
 
  if (distDiffc > 0) {
    gravityc *= 1.01;
  }
  else {
    gravityc *= .99;
  }


  if (key == CODED) {
    if (keyCode == LEFT) {
      b.velocity().add( -1, 0, 0 );
      keyCode=ALT;
    } 
    else if (keyCode == RIGHT) {
      b.velocity().add( 1, 0, 0 );
      keyCode=ALT;
    } 
    else if (keyCode == UP) {
      b.velocity().add( 0, -1, 0 );
      keyCode=ALT;
    }
    else if (keyCode ==DOWN) {
      b.velocity().add( 0, 1, 0 );
      keyCode=ALT;
    }
  }

  //stroke(100);

  //point(b.position().x(), b.position().y());
}

// really basic collision strategy:
// sides of the window are walls
// if it hits a wall pull it outside the wall and flip the direction of the velocity
// the collisions aren't perfect so we take them down a notch too
void handleBoundaryCollisions( Particle p )
{
  if ( p.position().x() < 0 || p.position().x() > width )
    p.velocity().set( -0.1*p.velocity().x(), p.velocity().y(), 0 );
  if ( p.position().y() < 0 || p.position().y() > height )
    p.velocity().set( p.velocity().x(), -0.1*p.velocity().y(), 0 );
  p.position().set( constrain( p.position().x(), 0, width ), constrain( p.position().y(), 0, height ), 0 );
}


float whatDist(float l, float m, float n, float o) {
  float disTance = sqrt((sq(l-n) + sq(m-o)));
  return disTance;
}


