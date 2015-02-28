
void setup ()

{
size (800,800);
background (255);
smooth();
}

void draw ()
{
 
  for (float x=0; x <= height; x= x+height/32.0)
{
line (width/4*3,x,height,x);
}

 for (float x=0; x <= height; x= x+height/16)
{
line (width/4*2,x,height,x);
}

for (float x=0; x <= height; x= x+height/8)
{
line (width/4,x,height,x);
}

for ( float x = 0; x <= width; x = x + width/4 )
{
line( x, 0, x, height );
}

for (float x=0; x <= height; x= x+height/4)
{
line (0,x,height,x);
}

}

