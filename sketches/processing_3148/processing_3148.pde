
// 2009 Daniel Winkler http://www.phyloa.com

Particle[] parts = new Particle[300];
PVector O = new PVector();

void setup()
{
  size( 800, 600, P3D );
  frameRate( 30 ); 
  for( int i = 0; i < parts.length; i++ )
  {
    parts[i] = new Particle(); 
  }
  noStroke();
  smooth();
  fill( 30, 200, 255 );
}

void draw()
{
  O.set( mouseX, mouseY, -500 );
  background( 0 );
  lights();
  for( int i = 0; i < parts.length; i++ )
  {
    parts[i].update(); 
  }
}

int size = 7;
   
public class Particle
{
  PVector loc = new PVector( random( 0, width ), random( 0, height ), random( -300, -700 ) );
  PVector speed = new PVector();

  public Particle()
  {

  } 

  public void update()
  {
    if( mousePressed )
    {
      PVector dir = new PVector( mouseX, mouseY, -500 );
      dir.sub( loc );
      dir.normalize();
      speed.add( dir );
    }
    else
    {
      speed.mult( .9 );
    }
    loc.add( speed );
    pushMatrix();
    translate( loc.x, loc.y, loc.z );
    rotateToFace( loc );
 
    beginShape( QUADS );
    vertex( -size, -size, 0 );
    vertex( size, -size, 0 );
    vertex( size, size, 0 );
    vertex( -size, size, 0 );
    endShape();
    popMatrix();
  }
}

// O is your object's position
// P is the position of the object to face
// U is the nominal "up" vector (typically Vector3.Y)
// Note: this does not work when O is straight below or straight above P
PVector U = new PVector( 0, 1, 0 );
void rotateToFace( PVector P )
{
  PVector D = new PVector( );
  D.set( O );
  D.sub( P );
  PVector Right = U.cross( D );
  Right.normalize();
  PVector Backwards = Right.cross( U );
  Backwards.normalize();
  PVector Up = Backwards.cross( Right );
  applyMatrix(Right.x, Right.y, Right.z, 0, Up.x, Up.y, Up.z, 0, Backwards.x, Backwards.y, Backwards.z, 0, 0, 0, 0, 1);
}


