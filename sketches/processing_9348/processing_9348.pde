
/*

  gmc_muster0004
  Gestalten mit Code
  FH Mainz
  
  Steffen Henschel
  2010 04 29
  
  */

int mini = 3;
int maxi = 23;
  
int bx; int hy; int x1; int y1;

int a = maxi; int b = maxi; int c = mini; int d = mini;
  
void setup() 
{
  size( 550, 550 );
  background( 255 );
  x1 = 0+mini;
  y1 = 0+mini;
  bx = width-mini;
  hy = height-mini;
  rectMode( CORNERS );
  noFill();
  //noLoop();
  frameRate( 20 );
}

void draw()
{
  background( 255 );
  for( int i = 0; i < 20; i++ )
  {
    
    rect( x1, y1, bx, hy );
    x1 += a;
    y1 += b;
    bx -= c;
    hy -= d;
    if( i == 1 ) { b = mini; d = maxi; }
    if( i == 4 ) { a = mini; c = maxi; }
    if( i == 8 ) { d = mini; b = maxi; }
    if( i == 13) { a = maxi; c = mini; }
    if( i == 19) 
    {
      x1 = 0+mini;
      y1 = 0+mini;
      bx = width-mini;
      hy = height-mini;
    }
  }
 
//  mini = int( random( 0, 8 ) );
//  maxi = int( random( 17, 30 ) );

//mini = int( mouseX/20 );
//maxi = int( mouseY/20 );
}

