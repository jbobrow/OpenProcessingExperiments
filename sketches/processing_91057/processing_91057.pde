
float x1, y1, wd1, ht1;
float x2, y2, wd2, ht2;
float x3, y3, wd3, ht3;
float x4, y4, wd4, ht4;

float x1speed, y1speed, x2speed, y2speed, x3speed, y3speed, x4speed, y4speed;


PImage bubbles;
PImage blossom;
PImage buttercup;
PImage mojo;
 
void setup ( )
{
  size (400, 400);
  smooth ( );
  background (153,225,245);
  
  
 blossom= loadImage ("blossom.png");
 bubbles= loadImage ("bubbles.png");
 buttercup= loadImage ("buttercup.png");
 mojo= loadImage ("mojo.png"); 
 
 //blossom 
 x1=200;
 y1=200;
 wd1=60;
 ht1=60;
 
 //bubbles
 x2= 200;
 y2=240;
 wd2=60;
 ht2=60;
 
 //buttercup
 x3=200;
 y3=280;
 wd3=60;
 ht3=60;
 
 //mojo
 x4=50;
 y4=50;
 wd4=60;
 ht4=60;
 
 //blossom
 x1speed=5;
 y1speed=6;
 
 //bubbles
 x2speed=4;
 y2speed=3;
 
 //buttercup
 x3speed=2;
 y3speed=3;
 
 //mojo
 x4speed=10;
 y4speed=5;
}

void draw()
{
 background( 153,224,245);

moveMojo();
moveBlossom();
moveBubbles();
moveButtercup();
drawblossom( x1, y1, wd1, ht1);
drawbubbles(x2, y2, wd2, ht2);
drawbuttercup (x3, y3, wd3, ht3);
drawmojo (x4, y4, wd4, ht4);
}

void drawblossom (float x1, float y1, float wd1, float ht1)
{
  image (blossom, x1, y1, wd1, ht1);
}

void drawbubbles (float x2, float y2, float wd2, float ht2)
{
  image (bubbles, x1, y2, wd2, ht2);
}

void drawbuttercup (float x3, float y3, float wd3, float ht3)
{
  image(buttercup, x3, y3, wd3, ht3);
}
void drawmojo (float x4, float y4, float wd4, float ht4)

{
  image(mojo, x4, y4, wd4, ht4);
}



void moveBlossom ()
{
   x2=x2+x2speed;
  if( x2>width*.75)
  {x2speed=-x2speed;}
  else if (x2<0)
  {x2speed=-x2speed;}
  
    y2=y2+y2speed;
  if( y2>height*.75)
  {y2speed=-y2speed;}
  else if (y2<0)
  {y2speed=-y2speed;}
}

void moveBubbles ()
{
   x3=x3+x3speed;
  if( x3>width*.75)
  {x3speed=-x3speed;}
  else if (x3<0)
  {x3speed=-x3speed;}
  
    y3=y3+y3speed;
  if( y3>height*.75)
  {y3speed=-y3speed;}
  else if (y3<0)
  {y3speed=-y3speed;}
}

void moveButtercup ()
{
   x3=x3+x3speed;
  if( x3>width*.75)
  {x3speed=-x3speed;}
  else if (x3<0)
  {x3speed=-x3speed;}
  
    y3=y3+y3speed;
  if( y3>height*.75)
  {y3speed=-y3speed;}
  else if (y3<0)
  {y3speed=-y3speed;}
}

void moveMojo ()
{ 
    y1=y1+y1speed;
  if( y1>height+50)
  {y1=-height;}
}

void keyPressed()
{
  if (key== 'a')
  {x1speed ++;}
}

