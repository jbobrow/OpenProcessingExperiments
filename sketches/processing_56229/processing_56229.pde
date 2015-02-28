
//----------------------
// by Danko 2012
//----------------------

int xoffset = 50;
int yoffset = 50;

int w = 12;
int h = 16;
int l = 5;
int lxSI, lySI;
int amplada, alcada;


void setup() {
  lxSI = w*l;
  lySI = h*l;
  amplada = xoffset*2 + lxSI;
  alcada = yoffset*2+lySI;

  size(amplada, alcada);
  background(255);
  
}
// RED
void draw() {
  fill(255,0,0);
  noStroke();
  SuperMario(xoffset, yoffset);
}


void SuperMario(int a, int b) {

  int[] vermell = {
    0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0,
    0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0,
    0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0,
    0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0,
    0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0,
    0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  };
 
  int[] negre = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 
    0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 
    0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 
    0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0,
    0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0,
    1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1,
    0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0,
    1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1,
  };

  int[] carn = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 
    0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 
    0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, 
    0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 
    0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 
    1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 
    1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  };

  int index=0;
  for (int j = 0; j<h; j++) 
  {
    for (int i = 0; i<w; i++)
    {
      if(vermell[index]==1)
        rect(a+i*l,b+j*l,l,l);
      index++;
     }
  }
  fill(90,90,90);   
  index=0;
  for (int k = 0; k<h;k++)
  {
    for (int m = 0; m<w; m++) 
    {
      if(negre[index]==1)
        rect(a+m*l,b+k*l,l,l);
      index++;
    }
  }
   fill(250,190,0);   
  index=0;
  for (int n = 0; n<h;n++)
  {
    for (int p = 0; p<w; p++) 
    {
      if(carn[index]==1)
        rect(a+p*l,b+n*l,l,l);
      index++;
    }
  }
}

