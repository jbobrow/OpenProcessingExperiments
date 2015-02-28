
// Hyun Woo Jo  
// Copyrighted 2013 Feb Hyun Woo Jo
float dir, t, pv;
float px, py, pSize, pxSpeed, old;
float bx, by, bxSpeed;

PImage p;

void setup( )
{
  size( 400, 400 ); 
  
  p = loadImage( "ball.png");
  imageMode( CENTER );
  smooth();
  
  dir = -1;
  t=0;
  
  px = 100;
  py = 100;
  pSize = 80;
  pxSpeed = random(-10,10)*0.1;
  
  bx = 100;
  by = 300;
  bxSpeed = 1.3;
}

void draw( )
{

   prepWindow( );
   drawImage( px, py, pSize);
   drawBoard( bx, by);
   moveImage( );
   moveBoard( );
      fill(50);
  textSize(20);
  text("Click to place ball",10,30);
}

void moveImage( )
{
   px = px + pxSpeed; 
   if ( px > width-38 ) 
   {
     pxSpeed = -pxSpeed;  
   }
   else if( px -38 < 0 )  
   {
     pxSpeed = -pxSpeed;  
   }
   if (py > height-38)
   {
     dir=1;
     t=0;
   }
   if (px > bx-20 & px<bx+140)
   {
     if(py+36<by && py+40 >by)
     {
     dir=1;
     t=0;
     }
   }
   if (dir==-1)
   {
     py = py+t*0.05;
     t=t+1;
     pv = t*0.05;
   }
   if (dir==1)
   {
     py = py-(pv-t*0.05);
     t = t+1;
   }
   
}

void moveBoard()
{
   bx = bx + bxSpeed; 
   if ( bx > width-120 ) // too far right?
   {
     bxSpeed = -bxSpeed;  // move left
   }
   else if( bx < 0 )  // too far left
   {
     bxSpeed = -bxSpeed;  // move right
   }
}
void drawImage( float px, float py, float pSize)
{
   image( p, px, py, pSize, pSize);
}

void drawBoard( float bx, float by)
{
  fill(40);
  rect(bx,by,120,20);
}

void prepWindow( )
{
  fill( 255 );
  rect( 0, 0, width, height );
}

void mouseClicked() 
{
  px = mouseX;
  py = mouseY;
  dir=-1;
  t=0;
  pxSpeed = random(-10,10)*0.1;
}


