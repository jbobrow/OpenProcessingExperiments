
PVector p0, p1;
void setup()
{
 
  size( 600,600 );
  p0 = new PVector( width * .5 - width * .25, height * .5 - height * .25 );
  p1 = new PVector( width * .5 + width * .25, height * .5 + height * .25 );
  
  
}

void draw()
{
  
  
  background( 0xFF );
  line( p0.x, p0.y, p1.x, p1.y );
  
  PVector m = new PVector( mouseX, mouseY );
  PVector pp = project( m, p0, p1 );
  ellipse( pp.x, pp.y, 10,10 );
  
  
}

PVector project( PVector p, PVector a, PVector b )
{
  return project( p, a, b, false );
}

PVector project( PVector p, PVector a, PVector b, Boolean asSegment )
{
  
  float A = p.x - a.x;
  float B = p.y - a.y;
  float C = b.x - a.x;
  float D = b.y - a.y;
  
  float dot = A * C + B * D;
  float len = C * C + D * D;
  float t = dot / len;
  
  if( asSegment )
  {
    if( t < 0 ) return a;
    if( t > 1 ) return b;
  }
  return new PVector( a.x + t * C, a.y + t * D );
  
}
