
//Homework 11
//copyright 2012 Alex Fischer ajfische

int MAX = 26; //range is 0 to 26

float [] x;
float [] y;
float [] sx;
float [] sy;
color [] col;
char [] chars;

void setup()
{
  size( 400, 400 );
  textSize( 24 );
  textAlign(CENTER);
  x = new float [MAX];
  y = new float [MAX]; 
  sx = new float [MAX]; 
  sy = new float [MAX]; 
  col = new color [MAX]; 
  chars = new char [26];
  
  initFloatArray ( x, 0, width);
  initFloatArray ( y, 0, height);
  initFloatArray ( sx, 5, 7);
  initFloatArray ( sy, 3, 5);
  initColorArray ( col );
  initCharArray ( chars );
  
  }

void draw()
{
  background(0);
  moveChars();
  drawChars();
}

void moveChars()
{
  for( int i = 0; i < x.length; i++)
  {
    x[i] += sx[i];
    if( x[i] > width || x[i] < 0 )
    {
      sx[i] = -sx[i];
      chars[i]++;
      if(chars[i] > 'z')
      {
        chars[i] = 'a';
      }
    }
    y[i] += sy[i];
    if( y[i] > height || y[i] < 0 )
    {
      sy[i] = -sy[i];
    }
  }
}

void drawChars()
{
  for( int i =0; i < x.length; i++)
  {
    fill( col[i] );
    text( chars[i], x[i], y[i] );
  }
}

void initFloatArray( float [] a, float low, float high )
{
  for(int i = 0; i < x.length ; i++ )
  {
    a[i] = int(random( low, high ) ) ;
  }
}

void initColorArray( color [] c )
{
  for( int i = 0; i < c.length ; i++)
  {
    c[i] = color(random(255), random(255), random(255) );
  }
}

void initCharArray( char [] ch )
{
  int i = 0;
  for( char cha = 'a'; cha <= 'z'; cha++, i++)
  {
    chars[i] = cha;
  }
}

