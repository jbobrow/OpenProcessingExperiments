
float Xini,ruidoX,ruidoY;

int w; int h;
int indx = 0;
int [] r = new int[32893];
int [] g = new int[32893];
int [] b = new int[32893];
int suma = 0;  int c = 0;
color micolor;


void setup()
{
  size(800,600);
  w = width; h = height;
  smooth(); noStroke();
  Xini = random(10);
  ruidoX = Xini;
  ruidoY = random(10);
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
  fondo();
  //background(0);
  
  for( int x = 0; x < w;  x+= int(w/60))
  {
    reset();
     ruidoY += 0.71;
    for( int y = 0; y< h; y+= int(h/60))
    {
      ruidoX += 0.71;
    
      dibujar(x, y, noise(ruidoX,ruidoY)); 
    }// end for x
  }// end for y
}// end draw


void dibujar(float x, float y, float fr)
{
   
  micolor = color( r[c],g[c],b[c]);
  stroke(micolor,40); strokeWeight(5);
  x += x * fr;  y += y * fr;
  point(x , y  );  
  
  c++;
  if ( c >= 32893) { c = 0; }
}

void reset()
{
  ruidoX = Xini;
}

void fondo()
{
   fill(255,3);
  rect(0,0,w,h);
}
