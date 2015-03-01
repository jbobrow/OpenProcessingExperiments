
//move a shape from left to right across the screen. when it moves off the right edge, return it to the left

int x=-0;

void setup ()
{ size (400,400);
noLoop();
;}

void draw ()
{background(121,255,33);
  ellipse(x,height/2,30,30);
 x+=6;
 
 if (x>width)
 { x=0;
 }
}


