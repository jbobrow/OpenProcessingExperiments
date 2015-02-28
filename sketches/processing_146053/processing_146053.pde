

//
// Conversione in Processing di "Quasicrystals as sums of waves in the plane"
// http://mainisusuallyafunction.blogspot.it/2011/10/quasicrystals-as-sums-of-waves-in-plane.html
//

float dimPix = 0.5;
int numeroLivelli = 7;

float passoOrientamenti = PI / numeroLivelli;

int xPixMax;
int yPixMax;

void setup()
{
  size(300, 300);
  xPixMax = width / 2;
  yPixMax = height / 2;

  loadPixels();
}

void draw()
{
  float tempo = frameCount*0.2;
  
  int iPix = 0;
  for (int yPix = -yPixMax;  yPix < yPixMax;  yPix++)
  {
    float y = yPix*dimPix;

    for (int xPix = -xPixMax;  xPix < xPixMax;  xPix++, iPix++) 
    {
      float x = xPix*dimPix;              

      float orientamento = 0.0;
      float seno;
      float coseno;
      float somma = 0;

      for (int i = 0; i < numeroLivelli; i++) {
        seno = sin(orientamento);
        coseno = cos(orientamento);
        somma += (cos( coseno*x + seno*y + tempo) + 1.0) / 2.0;
        orientamento += passoOrientamenti;
      }
      
      int interoSomma = floor(somma);
      float decimaliSomma = somma - interoSomma;
      somma = (interoSomma % 2) == 0 ? decimaliSomma : 1.0 - decimaliSomma; 

      pixels[iPix] = color(somma*256); 
    }
  } 
  updatePixels();
}
