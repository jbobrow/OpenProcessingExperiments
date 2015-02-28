
size (600,600);
smooth();
fill(0);
background (255);

for ( float y = 0 ; y < height ; y = y+60)
{

    fill(0);
    rect (0, y, width-y, 20); 
   }


for ( float x = 0 ; x < width ; x = x+60)
{
    fill(0);
    rect (x, 0, 20, height-x); 
   }


