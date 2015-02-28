
//Christian Murphy
//Copyright February 2013
//HW #6

float tx, ty, td, txSpeed, tySpeed;
float px, py, pSize, pxSpeed; 

PImage q;
PImage p;


boolean scaleDrawing;
void setup ( )
{
  size( 400, 533 );
  q = loadImage ("birch.jpg");
  background( q );
  println (q.width);
  println (q.height);
  smooth ( );
  tx = 0 ;
  ty = 200;
  td = 160;
  txSpeed = 4.5;
  tySpeed = 2;
  
  p = loadImage( "sarah.jpg" );
  imageMode ( CENTER );
  
  px = 200;
  py = random ( height );
  pSize = 120;
  pxSpeed = 1.5;
  
  scaleDrawing = false;

  
}

void draw( )
{
 background( q );
  prepWindow( );
  moveTarget( );
  drawTarget( tx, ty, td );
  drawImage( px, ty, pSize );
  moveImage3( );
  moveImage( );
  //moveImage2( );

}

 void keyPressed( )
{
 scaleDrawing = !scaleDrawing; //( 0 );// scale drawing?
}

void moveImage3( )
{
  ty = ty + tySpeed;
  if ( ty > height )
  {
    tySpeed = -tySpeed;
  }
  else if ( ty < 0 )
  {
    tySpeed = -tySpeed;
  }
}

void moveImage( )
{
  px = px + pxSpeed;
  if ( px > width )
  {
  pxSpeed = -pxSpeed;
  }
  else if( px < 0 )
  {
  pxSpeed = -pxSpeed;
  }  
}

void moveImage2( )
{
  if ( mouseX > pmouseX )
  {
    pxSpeed =+ 10;
  }
  px = px + pxSpeed;
  
  if ( px > width )
  {
    pxSpeed = -pxSpeed;
  }
}

void drawImage( float px, float py, float pSize )
{
  fill ( random (255), 255, random (255) );
  ellipse( px, py, pSize*1.5, pSize*1.5 );
  image( p, px, py, pSize, pSize );
}

void prepWindow( )
{
  fill( 255, 10 );
  rect( 0, 0, width, height );
  if(scaleDrawing)
  {
    translate( width*.5, height*.5 );
    scale( .34 );
    txSpeed = 18.1;
    
    //pxSpeed = 13.5;
  }
}
 
void moveTarget( )
{
  tx = tx + txSpeed;
  if( tx > width + td*.5 )
  {
    tx = -td*1.5;
  }
}

void drawTarget( float x, float y, float d)
{
  fill( 255, random (255), random (255) );
  ellipse( x*2, y*2, d, d );
  fill( random (255) ); //, 250, random (255) );
  ellipse( x, y, d*1.88, d*.88 );
  fill( 255, random (255), 0 );
  ellipse( x*2, y*2, d*.40, d*1.24 );
  fill( 250 );
  ellipse( x, y, d, d );
  fill( 2, 230, random (190) );
  rect( x*.5, y*.2, x*.5, x );
  fill( random (1), random (255), random (255) );
  rect( x*.5, y*.2, x*.25, x*.5 );
}

