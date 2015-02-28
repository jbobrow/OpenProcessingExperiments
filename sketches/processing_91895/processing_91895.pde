
//prisca a ohito. for and while loops. hw 8.
//copyright prisca a ohito 3/3/13

float x, y;
float xOffSet, yOffSet;
float xNoise, yNoise;
color col;
void setup()
{
  size(600, 600);
   
   background( 255 );
   col = color( random( 0, 256 ), random( 0, 256 ), random( 0, 256 ) );
   xOffSet = 0.00003;
   yOffSet = 0.000002;

}

void draw()
{
  background (255);
  if (keyPressed == true)
{
   whileRandomLine();
}else
{
  forRandomLine();
}
 
}

void whileRandomLine( )
{
    float x = 0;
    while (x < width/2)
    {
    stroke ( col );
    strokeWeight( 3 );
    x = random( width);
    y = random( height);
    line (x, y, x-width, y+height);
    x+=50;
    }
}

void forRandomLine()
{
  float x = 0;
  for (float y = 0; x < width; x+=15)
  { stroke ( col-100 );
    strokeWeight( 3 );
    x = random( width);
    y = random( height);
    xNoise = noise(xOffSet) * width;
    yNoise = noise(yOffSet) * height;
    line (x, y, x+width, y-height);
  }   
}
