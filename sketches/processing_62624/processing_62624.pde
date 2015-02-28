
// imagen fija 
int w = 800; int h  = 600;
int indx = 0;
int [] r = new int[32893];
int [] g = new int[32893];
int [] b = new int[32893];
int suma = 0;
color micolor;


void setup()
{
  size(800,600);
  iniciar();
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


void draw()
{
  int c = 0;
  
  for( int x = 0; x < w; x+= int(w/181))
  {
   for( int y = 0; y < h; y+= int(h/181))
   {
     micolor = color( r[c],g[c],b[c]);
     
     fill(micolor);
     rect(x,y,w/181,h/181);
     c++;
     if ( c >= 32893) { c = 0; }
   }
 }// end for x 
}
