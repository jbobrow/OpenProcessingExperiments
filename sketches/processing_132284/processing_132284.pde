
// ICE 7

/*
  Requirements:
    4 key inputs:
      '+'  increase rotXDelata  by 1
      '-'  decrease rotXdelata  by 1
      ' '  intrease transZDelta by 5
      'r'  reset variables to their initial values
      
    2 mouse inputs using mouseMoved( )"
      mouse moves right  increase redValue by 1
      mouse moves left   decrease redValue by 1

*/

float rotX, rotXDelta;
float redValue;

float transZ, transZDelta;

void setup ( )
{
  size( 600, 600, P3D );
  rotXDelta = 1;
  rotX = 0;
  redValue = 10;
  
  transZ = 0;
  transZDelta = 0;
 
  textSize( 18 );
  textAlign( CENTER );
  
  rectMode( CENTER );
}

void draw ( )
{
  pushMatrix( );
    prepareScreen( );
    drawFigure( );
  popMatrix( );
  showStats( );
}

void drawFigure( )
{
  noStroke( );
  fill( redValue, 0, 0, 150 ); 
  box( 100 ); 
  fill( 255, 255, 0, 70 );
  rect( 0, 0, 40, 30 );
  pushMatrix( );
    fill( 0, 200, 200, 70 );
    rotateY(radians( frameCount ) );
    box( 50 );
  popMatrix( );
  pushMatrix( );
    fill( 200, 0, 200, 70 );
    rotateY(radians( -frameCount*2 ) );
    box( 20 );
  popMatrix( );
}

void prepareScreen( )
{
  background( 0 );
  //lights( );
  translate( width/2, height/2, transZ );
  stroke( 200, 200, 0 );
  line( -200, 0, 0, 200, 0, 0 );
  fill( 200, 200, 0 );
  text( "X axis before rotation.", -200, -5, 0 );
  rotX += rotXDelta;
  rotateX( radians( 20 ) );
  rotateY( radians( rotX ) );
  text( "X axis during rotation.", 200, -5, 0 );
  line( -200, 0, 0, 200, 0, 0 );
  lights( );
}

void showStats( )
{
    fill( 255, 0, 0 );
    text( "redValue = " + redValue, 100, 20 );
    fill( 0, 255, 0 );
    text( "rotX = " + rotX, 100, height - 40 );
    text( "rotXDelta = " + rotXDelta, 100, height - 20 );
    text( "transZ = " + transZ, 100, height-60 );

}  

void mouseMoved ()
{
if (pmouseX < mouseX) {redValue+=30;}
else if (pmouseX>mouseX) {redValue-=20;}
}



void keyPressed ()
{
if (key == '+') {rotXDelta+=1;}
if (key == '-') {rotXDelta-=1;}
if (key == ' ') {transZ+=10;}
if (key =='r') {rotXDelta = 1;
  rotX = 0;
  redValue = 10;
  transZ = 0;
  transZDelta = 0;}
}






