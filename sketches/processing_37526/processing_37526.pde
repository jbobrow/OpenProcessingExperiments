
//homework 5
// copyright Joanne Ong September 2011 Pittsburgh, PA 15213

int x,y,ax,ay,bx,by,wd;

void setup()
{
 wd=400;
 size(400, 400);
 background(105,97,83);
 noCursor();
 noStroke();
 x=wd/2;
 y=0;
 ax=0;
 ay=wd;
 bx=wd;
 by=wd;
}

void draw ()
{ 
  y = height/2;  
  while ( y > 0 )
  {
if (x%2 == 0)    {
    fill( 255,213,150 );
}
    else
    {
    fill( 155,181,143 );
    }
     triangle(x,y,ax,ay,bx,by);
     y=y-5;  
     x=x-5;
     ax=ax-5;
     ay=ay-5;
     bx=bx-5;
     by=by-5;
  }
}


//saveFrame();


