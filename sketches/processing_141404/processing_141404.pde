
//copyright nickiecheung
//HW9
//3/21/2014

//define variables
String [ ] words = { 
  "we", "make", "the", "world", "go", "around"
};
PImage [ ] images = new PImage [ 3 ];
color bgColor = color( 170, 249, 240 );
color fontCol = color( 0 );
float x, dx, y, random;
float [ ] wheelX = new float [ 3 ]; 
float [ ] carX = { 
  50, 100, 50
};
PFont font;
PImage wheel, bill;



void setup( )
{
  size( 600, 600 );
  defArrays( );
  smooth( );

  imageMode( CORNER );

  //define variables
  x = 0;
  y = 0;
  dx = 5;
  wheel = loadImage( "carwheels.png" );
  bill = loadImage( "dollar bill.jpg" );
  //world = loadImage( "happy-world.png" );
}

void draw( )
{
  //reDraw background
  background( bgColor );
  drawStreets( );
  drawCars( );
  moveArrays( );
}

void defArrays( )
{
  //define image array
  for ( int i = 0; i<images.length; i++ )
  {
    images [i] = loadImage( i + ".png" );
  }
}

void drawStreets( )
{
  noStroke( );
  for ( int i = 0; i<images.length; i++ )
  {
    fill( 150 );
    image( bill, 0, i * 200 + 75 , width, 100 );
  }
}
void drawCars( )
{
  for ( int i = 0; i<images.length; i++ )
  {
    image( images [i], carX [ i ], i * 200 + 50 );
    image( wheel, carX [ i ], i * 200 + 50 );
  }
}
void drawWords( )
{
  textAlign( CENTER );
  font = loadFont( "ARBLANCA-48.vlw");
  for ( int i = 0; i<words.length; i++ )
  {
    textFont( font, 48 );
    fill( fontCol );
    text( words [i], x, y + i*50 + 50 );
  }
}

void moveArrays( )
{
  //rotate words clockwise
  pushMatrix( );
  translate( width/2, height/2 );
  rotate( degrees (frameCount / 10) );
  drawWords( );
  popMatrix( );
  //make cars move
  for ( int i = 0; i<images.length; i++ )
  {
    carX [i] = carX [i] + dx;
    if ( carX [i] > width )
    {
      carX [i] = - width*.666;
    }
  }
}

//void drawWorld( )
//{
//image( world, 0, 0, width, height );
//}

void keyPressed( )
{
  {
    if ( fontCol == color( 0 ))
    {
      fontCol = color( random( 255 ), random( 255 ), random( 255 ) );
    }
    else
    {
      fontCol = color ( 0 );
    }

    if ( bgColor == color( 170, 249, 240 ) )
    {
      bgColor = color( random( 255 ), random(255), random(255) );
    }
    else
    {
      bgColor = color( 170, 249, 240 );
    }
  }
}

//click the mouse to rearrange the car order
void mouseClicked( )
{
  for ( int i = 0; i<images.length; i++ )
  {
    if (carX [i] < width)
    {

      carX [i] = random( width );
    }
  }
}



