
int w = screen.width; int h  = screen.height;
int indx = 0;
int [] r = new int[32893];
int [] g = new int[32893];
int [] b = new int[32893];
int suma = 0;
color micolor;


void setup()
{
  size(w,h);
  iniciar();
  noStroke(); smooth();
}

void iniciar()
{
  for(int rr = 0; rr < 255; rr++)
  {
    for( int gg = 0 ; gg < 255; gg++)
    {
      for( int bb = 0; bb < 255; bb++)
      {
        suma = (rr + gg + bb);
        if(suma == 255 && indx < 32894)
        {
          r[indx] = rr; g[indx] = gg; b[indx] = bb;
          
          indx++;
        }
        
      }// end for bb
    }// end for gg
  }// end for RR

}// end iniciar

int c = 0; boolean flag = true;

void draw()
{
  for( int x = 0; x < w; x+= int(w/181))
  {
   for( int y = 0; y < h; y+= int(h/181))
   {
     
     fill(color( r[c],g[c],b[c]));
     ellipse(x,y,w/181,h/181);
     if(flag == true)
      { c++;}
     if ( c >= 32893) { flag = false; }
     if (flag == false)
     {
       c--;
     }
     if ( c <= 0 )
      {flag = true;}
   }// end for y
 }// end for x 
 
}
