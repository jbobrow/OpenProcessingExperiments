
final float Link1 = 100;
final float Link2 = 100;

float t1X;
float t1Y;

float t2X;
float t2Y;

void setup()
{
  size( 400,400 );
}

void draw()
{

  translate( width/2, height/2 );

  background(0);

  float x = mouseX - width/2;
  float y = mouseY - height/2;

  try
  {
    float a = acos( ( ( ( pow(x,2) + pow(y,2) ) * -1 ) + pow( Link2, 2 ) + pow( Link1, 2 ) ) / ( 2.0 * Link1 * Link2) );
    float b = acos( ( pow( Link2, 2 ) * -1 + pow(Link1,2) + ( pow(x,2) + pow(y,2) ) ) / ( 2 * Link1 * sqrt( ( pow(x,2) + pow(y,2) ) ) ) );

    float t1 = atan( y / x ) - b;
    float t2 = ( PI - a );

    float test = atan( y / x );

    if( x < 0 )
    {
      t1 += radians(180);
    }

    println( "X:" + x + " Y:" + y );
    println( "t1" + degrees(t1) );
    println( "t1 x:" + (Link1 * cos(t1) ) + " y:" + (Link1 * sin(t1) ) );
    println( "t2" + degrees(t2) );
    println( "t2 x:" + (Link2 * cos(t2) ) + " y:" + (Link2 * sin(t2) ) );
  
    float tmp_t1X = (Link1 * cos(t1) );
    float tmp_t1Y = (Link1 * sin(t1) );

    float tmp_t2X = (Link2 * cos(t1+t2) );
    float tmp_t2Y = (Link2 * sin(t1+t2) );
    
    if( !Float.isNaN(tmp_t1X) && !Float.isNaN(tmp_t1Y) && !Float.isNaN(tmp_t2X) && !Float.isNaN(tmp_t2Y) )
    {
      t1X = (Link1 * cos(t1) );
      t1Y = (Link1 * sin(t1) );
      
      t2X = (Link2 * cos(t1+t2) );
      t2Y = (Link2 * sin(t1+t2) );
    }

    strokeWeight( 10 );
    stroke( 0, 0, 255 );
    line( 0,0,t1X,t1Y);

    stroke( 0, 255, 0 );
    line( t1X,t1Y,t1X+t2X,t1Y+t2Y);


    //println( "test" + degrees(test) );
  }
  catch( Exception e )
  {
  }
}


