
//Jiyoung Lee
//jiyoung3@andrew.cmu.edu
//HW6
//Copyright@JiYoung Lee
float tx, ty, tSize, txSpeed, tySpeed;
float px, py, pSize, pxSpeed, pySpeed;

PImage q;
PImage p;

void setup( )
{
  size( 400, 400 ); 
  
  q = loadImage("heart3.png");
  imageMode(CENTER);
  tx = 200;
  ty = 200;
  tSize = 60;
  txSpeed = 4;
  tySpeed = 4;

 
 
  p = loadImage( "heart2.png");
  imageMode( CENTER );
  px = 200;
  py = 50;
  pSize = 80;
  pxSpeed = 1;
  pySpeed=1;
}


void draw( )
{
   background(250,243,106);
  prepWindow( );
   moveImage( );
   drawPicture( tx, ty, tSize );
   drawImage( px, py, pSize);
   movePicture( );
}

void moveImage( )
{
   px = px + pxSpeed; 
   if ( px > 400 ) 
   {
     pxSpeed = -pxSpeed;  
   }
   else if( px < 0 )  
   {
     pxSpeed = -pxSpeed; 
   }
    py = py + pySpeed; 
   if ( py > 400 ) 
   {
     pySpeed = -pySpeed;  
   }
   else if( py < 0 )  
   {
     pySpeed = -pySpeed; 
   }
  
}





void drawImage( float px, float py, float pd)
{
   fill( 0, 0, 255 );
  
   image( p, px, py, pSize, pSize);
   
    
}

void drawPicture( float tx, float ty, float td)
{
   fill( 0, 0, 255 );
  
   image( q, tx, ty, tSize, pSize);
}

void prepWindow( )
{
  fill( 255, 10 );
  rect( 0, 0, width, height );
}


void movePicture()
{
  tx=tx+txSpeed;
  if (tx> width)
  {tx=-width+tSize*.5;}

ty=ty+tySpeed;
if (ty>height)
{ty=-height+tSize*2;}

}

void keyPressed()
{
  if (key == '1')
  {txSpeed ++;}

  if (key == '2')
  {txSpeed --;}

  if (key == '3')
  {tySpeed ++;}

  if (key == '4')
  {tySpeed --;}

  if (key == 'q')
  {pxSpeed ++;}

  if (key == 'w')
  {pxSpeed --;}

  if (key == 'e')
  {pySpeed ++;}

  if (key == 'r')
  {pySpeed --;}
}






