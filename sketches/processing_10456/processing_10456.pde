
//decode pattern from Carina Schweitzer 2010
 
size (450,450);
smooth();
fill(0);
background (255);
rectMode (CENTER);
 
 
for ( float y = 0 ; y < height/2 ; y = y+25)
{
    float w = map( y, 0, height/2, width/17, 12 );
    for (float x = 0; x < width; x = x+40)
   {
    fill(0);
    ellipse (x+15, y+15, w, w);
     
    ellipse (x+15, height - y+15, w, w);
   }
}

