
import traer.physics.*;

Particle mouse, b;
ParticleSystem physics;

float pastX;
float pastY;

float gravity = 10;

float gravityFactor = .5;

void setup()
{
  size( 1300, 700 );
  frameRate( 60 );
  smooth();
  ellipseMode( CENTER );
  noStroke();
  noCursor();
  background (0);

  physics = new ParticleSystem();
  mouse = physics.makeParticle();
  mouse.makeFixed();
  b = physics.makeParticle( 5, 0, 0, 0 );
  b.velocity().add( (random(100)/100), (random(100)/25), 0 );
  //c = physics.makeParticle( 1.0, random( 0, width ), random( 0, height ), 0 );

  //physics.makeAttraction( mouse, b, 2000, 10 );
  //physics.makeAttraction( mouse, c, 5000, 10 );
  //physics.makeAttraction( b, c, -10000, 5 );
}

void draw()
{
   println("g"+gravity);
  physics.makeAttraction( mouse, b, gravity, 1000 );
  mouse.position().set( 650, 350, 0 );
  //handleBoundaryCollisions( b );
  

  //handleBoundaryCollisions( c );

  //background( 255 );

  stroke( random(120)+127 );
  noFill();
  //ellipse( mouse.position().x(), mouse.position().y(), 35, 35 );

  fill( 0 );
  //ellipse( b.position().x(), b.position().y(), 5, 5 );
  pastX = b.position().x();
  pastY = b.position().y();
 
  float distance1 = whatDist(650, pastX, 350, pastY);
   
  physics.tick(1);
  
  float distance2 = whatDist(650,  b.position().x(), 350, b.position().y());
  
  strokeWeight(1);
  //point(b.position().x(), b.position().y());
  //point(b.position().x(), b.position().y());
  //point(b.position().x(), b.position().y());
  line( pastX, pastY,  b.position().x(),  b.position().y());


  float distDiff = (distance2 - distance1); 
  println("dd:"+distDiff);
  println(constrain(gravity,0,10000));
  if (distDiff > 0){
    gravity *= 1.01;}else{gravity *= .99;}


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


