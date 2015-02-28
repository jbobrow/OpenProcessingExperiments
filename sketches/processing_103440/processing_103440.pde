
// target drawing program
// copyright ...
float tx, ty, td, txSpeed;





























float tx2, ty2;
float px, py, pSize, pxSpeed;

PImage p;

boolean scaleDrawing;
void setup( )
{
  size( 600, 200 ); 
  td = 60;
  tx = 0;
  ty = random(td, height-td  );
  
  ty2 = ty;
  tx2 = -width;

  txSpeed = 2;
  
  p = loadImage( "Jim.jpg");
  imageMode( CENTER );
  
  px = 100;
  py = random( height );
  pSize = 80;
  pxSpeed = 1;
  
  scaleDrawing = false;
}

void draw( )
{
   prepWindow( );
   moveTarget( );
   drawTarget( tx, ty, td );
   drawTarget( tx2, ty2, td );
   //drawImage( );
   //moveImage( );
}

void mousePressed( )
{
   noLoop( ); 
}

void mouseReleased( )
{
   loop( ); 
}

void keyPressed( )
{
   scaleDrawing = !scaleDrawing;
}

void moveImage( )
{
   px = px + pxSpeed; 
   if ( px > width ) // too far right?
   {
     pxSpeed = -pxSpeed;  // move left
   }
   else if( px < 0 )  // too far left
   {
     pxSpeed = -pxSpeed;  // move right
   }
}

void drawImage( )
{
   fill( 0, 0, 255 );
   ellipse( px, py, pSize*1.5, pSize*1.5);
   image( p, px, py, pSize, pSize);
   
    
}

void prepWindow( )
{
  fill( 200, 200, 0, 10 );
  rect( 0, 0, width, height );
  if(scaleDrawing)
  {
     translate( width/2, height/2);
     scale( .25 );
     rect( 0, 0, width, height );
  }
}
void moveTarget( )
{
  tx = tx  + txSpeed;
  if( tx > width + td*.50 )  //  is the target too far to the right?
  {
    tx = -width+td*.50;  // move it back to the left side
  }  
  
  tx2 = tx2  + txSpeed;
  if( tx2 > width + td*.50 )  //  is the target too far to the right?
  {
    tx2 = -width+td*.50;  // move it back to the left side
  }
}

void drawTarget( float x, float y, float d)
{
  fill( 255, 0, 0);
  ellipse( x, y, d, d );
  fill( 0, 255, 0 );
  ellipse( x, y, d*.66, d*.66 );
  fill( 0, 0, 255 );
  ellipse( x, y, d*.33, d*.33 );
  
}


