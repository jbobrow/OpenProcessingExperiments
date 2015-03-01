
int   numParticles = 100;
float radius = 30.0;

class Point
{
  float _x;
  float _y;

  Point( float x, float y )
  { 
    _x = x;
    _y = y;
  }
  
  Point( Point p )
  {
    _x = p._x;
    _y = p._y;
  }
}

// distane squared function
float d2( Point a, Point b )
{
  return ( a._x - b._x ) * ( a._x - b._x ) + ( a._y - b._y ) * ( a._y - b._y );
}

class Particle
{
  Point _s;
  Point _v;
  float _diameter;
  Particle( float x, float y, float d )
  {
    _s = new Point( x, y );
    _v  = new Point( 0.0, 0.0 );
  }
  void Draw( )
  {
    ellipse( _s._x, _s._y, radius, radius );
  }
}

Particle particles[] = null;

Point normalise( Point p )
{
  Point p2 = new Point( p );
  float len = sqrt( d2( p, new Point( 0.0, 0.0 ) ) );
  p2._x /= len;
  p2._y /= len;
  return p2;
}

void calcVelocities()
{
  for( int i = 0; i < numParticles; i++ )
  {
    Point f = new Point( 0.0, 0.0 );
    
    for ( int j = 0; j < numParticles; j++ )
    {
      if ( i == j )
        continue;
      float len2       = d2( particles[ i ]._s, particles[ j ]._s );
      Point direction = new Point( particles[ i ]._s._x - particles[ j ]._s._x,
                                   particles[ i ]._s._y - particles[ j ]._s._y );
      direction = normalise( direction );
      if ( len2 > radius * radius  )
      {
        f._x -= direction._x * 1000.0/len2;
        f._y -= direction._y * 1000.0/len2;
      }
      else
      {
        f._x += direction._x * 75.0;
        f._y += direction._y * 75.0;
      }
      
    }
    particles[ i ]._v._x += f._x * 0.01;
    particles[ i ]._v._y += f._y * 0.01;
    
    particles[ i ]._v._x *= 0.75;
    particles[ i ]._v._y *= 0.75;
    
  }  
}

void calcPositions()
{
  for ( int i = 0; i < numParticles; i++ )
  {
    particles[ i ]._s._x += particles[ i ]._v._x;
    particles[ i ]._s._y += particles[ i ]._v._y;
  }
}

void drawParticles()
{
  for( int i = 0; i < numParticles; i++ )
  {
    particles[ i ].Draw();
  }
}

void setup()
{
  strokeWeight( 5 );
  stroke(127);
  size( 400, 400 );
  particles = new Particle[ numParticles ];
  for( int i = 0; i < numParticles; i++ )
  {
    particles[ i ] = new Particle( random( width ), random( height ), 10.0 );
  }
}

void draw()
{
  background( 200 );
  for ( int i = 0; i < 1; i++ )
  {
    calcVelocities();
    calcPositions();
  }
  drawParticles();
}

void keyPressed()
{
  setup();
}
