

ArrayList<PVector> points;
ArrayList<PVector> curve;


void setup()
{
  size( 600,600 );
  points = new ArrayList<PVector>();
  curve = new ArrayList<PVector>();
}

void draw()
{
  
  background( 0xFF );
  
  if( points.size() == 0 ) return;
  
  stroke( 0 );
  strokeWeight( 1 );
  PVector n = points.get( 0 );
  for( PVector p : points )
  {
    ellipse( p.x, p.y, 10,10 );
    line( n.x, n.y, p.x, p.y );
    n = p;
  }


  float time = millis() * 0.001;
  float oscillation = .5 + sin( time ) * .5;
  
  
  PVector p = drawCurve( points, oscillation );
  if( p != null )curve.add( p );
  
  if( curve.size() > 0 )
  {
    stroke( 0xFF, 0, 0 );
    strokeWeight( 3 );
    n = curve.get( 0 );
    for( PVector _p : curve )
    {
      line( n.x, n.y, _p.x, _p.y );
      n = _p;
    }
  }
  
}


    
    PVector  drawCurve( ArrayList<PVector> points, float t ) 
    {
      
      if ( points.size() < 2 ) return null;
      
      
      ArrayList<PVector> tmp = new ArrayList<PVector>();
      for( PVector p : points ) tmp.add( p );
      
      while ( tmp.size() > 1 ) 
      {
        
        ArrayList<PVector> pts = new ArrayList<PVector>();
        for ( int i = 0; i < tmp.size() - 1; i++ )
        {
          
          PVector p = interpolation(   tmp.get( i ), 
                                       tmp.get( i + 1 ), 
                                       t );
          pts.add( p );
          
        }
        tmp = new ArrayList<PVector>();
        for( PVector p : pts ) tmp.add( p );
        
      }
      return tmp.get( 0 );
      
    }
    
    PVector interpolation( PVector p0, PVector p1, float t )
    {
      PVector p = new PVector();
      p.x = p0.x + ( p1.x - p0.x ) * t;
      p.y = p0.y + ( p1.y - p0.y ) * t;
      return p;
      
    }
    
void mousePressed()
{
  points.add( new PVector( mouseX, mouseY ) );
  curve = new ArrayList<PVector>();
}
void keyPressed()
{
  points = new ArrayList<PVector>();
  curve = new ArrayList<PVector>();
}
class Utils
{
 
  float interpolate( float t, float a, float b )  
  {
   return a + ( b - a ) * t; 
  }
  
  
  float normalization( float t, float a, float b )  
  {
   return ( t - a ) / ( b - a ); 
  }
  
  float remap( float t, float a0, float b0, float a1, float b1 )  
  {
   return interpolate( normalization( t, a0, b0 ), a1, b1 ); 
  }
}



