
int edge = 10;


void setup()
{
  size(edge*3*16, edge*4*16);
  background(255);
}

void draw()
{
 fill(0);
 
 for( int ix = 0; ix < edge*3*16; ix = ix + 3*edge)
 {
   for( int iy = 0; iy < edge*4*16; iy = iy + 4*edge)
   {

     rect(ix, iy, edge, edge*2);
     rect(ix+edge, iy+edge, edge, edge*3);
     rect(ix+edge*2, iy+edge*2, edge, edge);
     
   }
 }
}

