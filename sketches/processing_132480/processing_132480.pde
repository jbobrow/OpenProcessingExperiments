
float rotX, rotXDelta; 
float redValue;
float transZ, transZDelta;

void setup ( ) 
{
size( 800, 500, P3D ); 
rotXDelta = 0;
rotX = 0;
redValue = 127;
transZ = 5; transZDelta = 5;
textSize( 18 ); 
textAlign( CENTER );
rectMode( CENTER ); 
}

void draw ( ) 
{
pushMatrix( ); prepareScreen( ); drawFigure( );
popMatrix( );
showStats( ); 
}

void drawFigure( ) 
{ 
noStroke( );
fill( redValue, 0, 0 ); box( 100 );
fill( 255, 255, 0, 70 ); rect( 0, 0, 40, 30 ); pushMatrix( );
fill( 0, 200, 200, 70 ); rotateY(radians( frameCount ) ); box( 50 );
popMatrix( ); pushMatrix( );
fill( 200, 0, 200, 70 ); rotateY(radians( -frameCount*2 ) ); box( 20 );
popMatrix( ); 
}

void prepareScreen( ) 
{
background( 0 );
lights( );
translate( width/2., height/2, transZ);
stroke( 200, 200, 0);
line( -200, 0, 0, 200, 0, 0 ); 
fill( 200, 200, 0 );
text( "X axis before rotation.", -200, -5, 0 ); 
rotX += rotXDelta;
rotateX( radians( 20 ) );
rotateY( radians( rotX ) );
text( "X axis during rotation.", 200, -5, 0 );
line( -200, 0, 0, 200, 0, 0 ); }

void showStats( )
{
fill( 255, 0, 0 );
text( "redValue = " + redValue, 100, 20 );
fill( 0, 255, 0 );
text( "rotX = " + rotX, 100, height - 40 );
text( "rotXDelaa = " + rotXDelta, 100, height - 20 ); 
text( "transZ = " + transZ, 100, height-60 );
}

void mouseMoved()
{
  if (mouseX > pmouseX)
  {
    redValue++;
  }
  else if (mouseX < pmouseX)
  {
    redValue--;
  }
}

void keyPressed()
{
  if(key == '+')
  {
    rotXDelta++;
  }
  else if(key == '-')
  {
    rotXDelta--;
  }
  else if(key == ' ')
  {
    transZ++;
  }
  else if (key == 'r')
  {
   rotXDelta = 0;
   rotX = 0;
   redValue = 127;
   transZ = 0; 
   transZDelta = 5;
  }
}


