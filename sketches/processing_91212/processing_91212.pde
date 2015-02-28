
//hw 8
//copyright jingjing chen jingjin1@andrew.cmu.edu

float bacColor = 0;

void setup( )
{
  size ( 250,200 );
  smooth( );
}

void draw( )
{
  background(20);
  absDraw( );
  lineDance( );
  bacColor( );
}

void absDraw( )
{
  fill( 100,10 );
  for ( int x=5 ; x < width ; x+=12 )
  {
    for( int y=5; y < height; y+=4 )
    {
      ellipse( 1.5*x, 1.5*y, 0.8*x, 0.8*x );
    }
  }
}

void lineDance( )
{ 
  pushStyle();
  stroke( 200,100 );
  for ( int x = 20; x<width; x+=20)
  {
    if ( mouseX<=0.5*width )
    {
      float mx = mouseX/10.0;
      float offsetA = random(-mx,mx);
      float offsetB = random(-mx,mx);
      line(x+offsetA, 0, x + offsetB, height);
    }

  else if( mouseX > 0.5*width )
  {
    float mx = -0.1 * mouseX+24;
    float offsetA = random( -mx,mx );
    float offsetB = random( -mx,mx );
    line(x+offsetA, 0, x + offsetB, height);
    }
  }    
  popStyle( );
}

void bacColor( )
{
  while( bacColor < 255 )
  {
    stroke( 0, 0, bacColor/2 );
    line( bacColor, 0, bacColor, width );
    bacColor++;
  }
}

void keyPressed ( )
{
  if (key == ' ') 
  {
    background( 0 );
    fill( #FFDB0A );
    ellipse ( width/2, height/2, width/4, width/4 );
  }
}

